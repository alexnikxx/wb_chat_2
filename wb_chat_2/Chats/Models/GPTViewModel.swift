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
    @Published var GPTmessages: [GPTRequestMessage] = []
    @Published var chatMessages: [Message] = []
    @Published var inputText: String = ""
    
    @Published var model: GPTModel = .gpt4o_mini

    //private let interactor: ChatInteractorProtocol
    private var subscriptions = Set<AnyCancellable>()

//    init(interactor: ChatInteractorProtocol) {
//        self.interactor = interactor
//    }
//    
//    func send(draft: DraftMessage) {
//        interactor.send(draftMessage: draft)
//    }
//    
//    func onStart() {
//        interactor.messages
//            .compactMap { messages in
//                messages.map { $0.toChatMessage() }
//            }
//            .assign(to: &$chatMessages)
//
//        interactor.connect()
//    }
//
//    func onStop() {
//        interactor.disconnect()
//    }
//    
//    // Конвертируем сообщение в ChatMessage
//    private func convertToChatMessage(_ message: GPTRequestMessage) -> Message {
//        return Message(
//            user: ChatUser(userId: message.role, userName: message.role.capitalized),
//            text: message.content,
//            time: Date()
//        )
//    }
//    
    
    // Отправка сообщения и получение ответа от OpenAI API
    func sendMessage() {
        guard !inputText.isEmpty else { return }
        
        let userMessage = GPTRequestMessage(role: Role.user.rawValue, content: inputText)
        GPTmessages.append(userMessage)
        inputText = ""

        let request = GPTRequest(
            model: model.rawValue,
            messages: GPTmessages,
            maxTokens: 300,
            temperature: 0.7,
            topP: 0.9
        )
        
        DefaultAPI.createChatCompletion(request: request) { [weak self] response, error in
            guard let self = self, let response = response else {
                if let error = error {
                    DispatchQueue.main.async {
                        self?.GPTmessages.append(GPTRequestMessage(role: Role.system.rawValue, content: "❗️Error: \(error.localizedDescription)"))
                    }
                }
                return
            }
            
            if let completion = response.choices?.first?.message?.content {
                DispatchQueue.main.async {
                    let gptMessage = GPTRequestMessage(role: Role.assistant.rawValue, content: completion)
                    self.GPTmessages.append(gptMessage)
                }
            }
        }
    }
    
    func clearHistory() {
        GPTmessages.removeAll()
    }
}
