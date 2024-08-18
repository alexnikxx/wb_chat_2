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

enum GPTModel: String {
    case gpt3_5_turbo = "gpt-3.5-turbo"
    case gpt4o_mini = "gpt-4o-mini"
    case gpt4o = "gpt-4o"
}

final class GPTViewModel: ObservableObject {
   // @Published var GPTmessages: [GPTRequestMessage] = []
    @Published var chatMessages: [MockMessage] = []
    @Published var model: GPTModel = .gpt4o_mini
    
    private let systemUser = MockUser(id: "3", role: .system, lastVisit: Date(), imageName: nil)
    private let gptUser = MockUser(id: "2", role: .assistant, lastVisit: Date(), imageName: AssetExtractor.createLocalUrl(forImageNamed: "ChatGPT_logo") ?? URL(string: ""))
    private let currentUser = MockUser(id: "1", role: .user, lastVisit: Date(), imageName: AssetExtractor.createLocalUrl(forImageNamed: "userBig") ?? URL(string: ""))
    
    
    var GPTmessages: [GPTRequestMessage] {
        chatMessages.map { message in
            GPTRequestMessage(role: message.sender.role.rawValue, content: message.text)
        }
    }
    
    var messages: [Message] {
        chatMessages.map { $0.toChatMessage() }
    }
    
    // Отправка сообщения и получение ответа от OpenAI API
    func sendMessage(draftMessage: DraftMessage) {
        let userMessage = MockMessage(uid: UUID().uuidString, sender: currentUser, createdAt: Date(), text: draftMessage.text)
        chatMessages.append(userMessage)
        
        let request = GPTRequest(
            model: model.rawValue,
            messages: GPTmessages,
            maxTokens: 300,
            temperature: 0.7,
            topP: 0.9
        )
        
        DefaultAPI.createChatCompletion(request: request) { [weak self] response, error in
            guard let self = self else { return }
            guard let response = response else {
                if let error = error {
                    DispatchQueue.main.async {
                        let errorMessage = MockMessage(uid: UUID().uuidString, sender: self.systemUser, createdAt: Date(), text: "❗️Error: \(error.localizedDescription)")
                        self.chatMessages.append(errorMessage)
                    }
                }
                return
            }
            
            if let completion = response.choices?.first?.message?.content {
                DispatchQueue.main.async {
                    let gptMessage = MockMessage(uid: UUID().uuidString, sender: self.gptUser, createdAt: Date(), text: completion)
                    self.chatMessages.append(gptMessage)
                }
            }
        }
    }
    
    func clearHistory() {
        chatMessages.removeAll()
    }
}

class AssetExtractor {
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
