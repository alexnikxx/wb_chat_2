//
//  GPTViewModel.swift
//  wb_chat_2
//
//  Created by Tatiana Lazarenko on 8/16/24.
//

import SwiftUI
import Combine
import OpenAIAPI

enum Role: String {
    case user = "user"
    case assistant = "assistant"
    case system = "system"
}

final class GPTViewModel: ObservableObject {
    @Published var messages: [GPTRequestMessage] = []
    @Published var inputText: String = ""

    private var cancellables = Set<AnyCancellable>()
    
    // Отправка сообщения и получение ответа от OpenAI API
    func sendMessage() {
        guard !inputText.isEmpty else { return }
        
        let userMessage = GPTRequestMessage(role: Role.user.rawValue, content: inputText)
        messages.append(userMessage)
        inputText = ""

        let request = GPTRequest(
            model: "gpt-4o-mini",
            messages: messages,
            maxTokens: 300,
            temperature: 0.7,
            topP: 0.9
        )
        
        DefaultAPI.createChatCompletion(request: request) { [weak self] response, error in
            guard let self = self, let response = response else {
                if let error = error {
                    DispatchQueue.main.async {
                        self?.messages.append(GPTRequestMessage(role: Role.system.rawValue, content: "❗️Error: \(error.localizedDescription)"))
                    }
                }
                return
            }
            
            if let completion = response.choices?.first?.message?.content {
                DispatchQueue.main.async {
                    let gptMessage = GPTRequestMessage(role: Role.assistant.rawValue, content: completion)
                    self.messages.append(gptMessage)
                }
            }
        }
    }
    
    func clearHistory() {
        messages.removeAll()
    }
}
