//
//  GPTViewModel.swift
//  wb_chat_2
//
//  Created by Tatiana Lazarenko on 8/16/24.
//

import SwiftUI
import Combine
import OpenAIAPI
import ExyteChat
import UIKit
import SwiftData

enum GPTModel: String {
    case gpt3_5_turbo = "gpt-3.5-turbo"
    case gpt4o_mini = "gpt-4o-mini"
    case gpt4o = "gpt-4o"
}

final class GPTViewModel: ObservableObject {
    @Published var model: GPTModel = .gpt4o_mini
    @Published var chats: [Chat] = []
    @Published var currentChat: Chat?
    @Published var isLoading: Bool = false
    @Environment(\.modelContext) private var modelContext: ModelContext
    
    var chatIndex: Int {
        chats.firstIndex(where: { $0.id == currentChat?.id }) ?? 0
    }
    
    var GPTmessages: [GPTRequestMessage] {
        let sortedMessages = self.chats[self.chatIndex].messages.sorted(by: { $0.createdAt < $1.createdAt })
        return sortedMessages.map { message in
            GPTRequestMessage(role: message.sender.role.rawValue, content: message.text)
        }
    }
    
    var messages: [Message] {
        
        let sortedMessages = self.chats[self.chatIndex].messages.sorted(by: { $0.createdAt < $1.createdAt })
        return sortedMessages.map { $0.toChatMessage() }
    }
    
    
    
    private let systemUser = MockUser(id: "3", role: .system, lastVisit: Date(), imageName: nil)
    private let gptUser = MockUser(id: "2", role: .assistant, lastVisit: Date(), imageName: AssetExtractor.createLocalUrl(forImageNamed: "ChatGPT_logo") ?? URL(string: ""))
    private let currentUser = MockUser(id: "1", role: .user, lastVisit: Date(), imageName: AssetExtractor.createLocalUrl(forImageNamed: "userBig") ?? URL(string: ""))
    
    //MARK: - Работа со списком чатов
    func addNewChat(modelContext: ModelContext) {
        let newChat = Chat(title: "New Chat")
        modelContext.insert(newChat)
        do {
            try modelContext.save()
            chats.append(newChat)
            currentChat = newChat
        } catch {
            print("Failed to save new chat: \(error.localizedDescription)")
        }
    }
    
    func switchToChat(_ chat: Chat) {
        currentChat = chat
    }
    
    func deleteChat(at offsets: IndexSet, modelContext: ModelContext) {
        for index in offsets {
            let chatToDelete = chats[index]
            modelContext.delete(chatToDelete)
        }
        
        do {
            try modelContext.save()
            chats.remove(atOffsets: offsets)
        } catch {
            print("Failed to delete chat: \(error.localizedDescription)")
        }
    }
    
    //MARK: - Работа с 1 чатом
    // Очистить историю сообщений текущего чата
    func clearHistory(modelContext: ModelContext) {
        guard let currentChat = currentChat else { return }
        
        // Удаление сообщений из модели данных
        for message in currentChat.messages {
            modelContext.delete(message)
        }
        
        do {
            try modelContext.save()
            DispatchQueue.main.async {
                self.chats[self.chatIndex].messages.removeAll()
            }
        } catch {
            print("Failed to clear history: \(error.localizedDescription)")
        }
    }
    
    func makeRequest(model: String, messages: [GPTRequestMessage], maxTokens: Int, temperature: Double, topP: Double) -> GPTRequest {
        return GPTRequest(model: model,
                          messages: messages,
                          maxTokens: maxTokens,
                          temperature: temperature,
                          topP: topP
        )
        
    }
    
    // Отправка сообщения и получение ответа от OpenAI API
    func sendMessage(draftMessage: DraftMessage, modelContext: ModelContext) {
        let userMessage = MockMessage(uid: UUID().uuidString, sender: currentUser, createdAt: Date(), text: draftMessage.text)
        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()
        DispatchQueue.main.async {
            self.chats[self.chatIndex].messages.append(userMessage)
            self.saveMessage(userMessage, modelContext: modelContext)
            self.isLoading = true
            dispatchGroup.leave() // Сообщаем, что добавление сообщения завершено
        }
        
        dispatchGroup.notify(queue: .main) {
            
            DefaultAPI.createChatCompletion(request: self.makeRequest(model: self.model.rawValue, messages: self.GPTmessages, maxTokens: 300, temperature: 0.7, topP: 0.9)) { [weak self] response, error in
                guard let self = self else { return }
                guard let response = response else {
                    if let error = error {
                        DispatchQueue.main.async {
                            
                            let errorMessage = MockMessage(uid: UUID().uuidString, sender: self.systemUser, createdAt: Date(), text: "❗️Error: \(error.localizedDescription)")
                            
                            self.chats[self.chatIndex].messages.append(errorMessage)
                            self.saveMessage(errorMessage, modelContext: modelContext)
                            self.isLoading = false
                            
                        }
                    }
                    return
                }
                
                if let completion = response.choices?.first?.message?.content {
                    DispatchQueue.main.async {
                        let gptMessage = MockMessage(uid: UUID().uuidString, sender: self.gptUser, createdAt: Date(), text: completion)
                        self.chats[self.chatIndex].messages.append(gptMessage)
                        self.saveMessage(gptMessage, modelContext: modelContext)
                        self.isLoading = false
                        
                        self.generateChatTitle(for: self.chatIndex)
                    }
                }
            }
        }
    }
    
    // Генерация заголовка на основе истории сообщений
    private func generateChatTitle(for chatIndex: Int) {
        let summaryRequest = GPTRequest(
            model: model.rawValue,
            messages: GPTmessages + [
                GPTRequestMessage(role: "system", content: "Please summarize the conversation in one short title (2-3 words) and give answer using conversation language.")
            ],
            maxTokens: 20,
            temperature: 0.5,
            topP: 0.5
        )
        
        DefaultAPI.createChatCompletion(request: summaryRequest) { [weak self] response, error in
            guard let self = self, let response = response else { return }
            
            if let summary = response.choices?.first?.message?.content {
                DispatchQueue.main.async {
                    self.chats[chatIndex].title = summary
                }
            }
        }
    }
    
    private func saveMessage(_ message: MockMessage, modelContext: ModelContext) {
        modelContext.insert(message)
        do {
            try modelContext.save()
        } catch {
            print("Failed to save message: \(error.localizedDescription)")
        }
    }
    
    func loadChats(modelContext: ModelContext) {
        let fetchDescriptor = FetchDescriptor<Chat>(sortBy: [SortDescriptor(\.title, order: .forward)])
        
        do {
            let loadedChats = try modelContext.fetch(fetchDescriptor)
            DispatchQueue.main.async {
                self.chats = loadedChats
                self.currentChat = loadedChats.first
            }
        } catch {
            print("Failed to load chats: \(error.localizedDescription)")
        }
    }
    
}


// Создает ссылку на изображение, находящееся в ассетах
final class AssetExtractor {
    static func createLocalUrl(forImageNamed name: String) -> URL? {
        let fileManager = FileManager.default
        let cacheDirectory = fileManager.urls(for: .cachesDirectory, in: .userDomainMask)[0]
        let url = cacheDirectory.appendingPathComponent("\(name).pdf")
        
        guard fileManager.fileExists(atPath: url.path) else {
            guard
                let image = UIImage(named: name),
                let data = image.pngData()
            else { return nil }
            
            fileManager.createFile(atPath: url.path, contents: data, attributes: nil)
            return url
        }
        
        return url
    }
}
