//
//  GPTViewModel.swift
//  wb_chat_2
//
//  Created by Tatiana Lazarenko on 8/16/24.
//

import SwiftUI
import Combine
import OpenAIAPI

final class GPTViewModel: ObservableObject {
    @Published var messages: [String] = []
    @Published var inputText: String = ""

    private var cancellables = Set<AnyCancellable>()
    
    func sendMessage() {
        guard !inputText.isEmpty else { return }
        
        let userMessage = inputText
        messages.append("You: \(userMessage)")
        inputText = ""
        
        let request = CreateChatCompletionRequest(
            model: "gpt-4o-mini",
            messages: [CreateChatCompletionRequestMessagesInner(role: "user", content: userMessage)],
            maxTokens: 100,
            temperature: 0.7,
            topP: 0.9
        )
        
        DefaultAPI.createChatCompletion(createChatCompletionRequest: request) { [weak self] response, error in
            guard let self = self, let response = response else {
                if let error = error {
                    DispatchQueue.main.async {
                        self?.messages.append("❗️Error: \(error.localizedDescription)")
                    }
                }
                return
            }
            
            if let completion = response.choices?.first?.message?.content {
                DispatchQueue.main.async {
                    self.messages.append("GPT: \(completion)")
                }
            }
        }
    }
}

class ChatViewModel: ObservableObject {
    @Published var messages: [CreateChatCompletionRequestMessagesInner] = []
    @Published var inputText: String = ""

    private var cancellables = Set<AnyCancellable>()
    
    // Отправка сообщения и получение ответа от OpenAI API
    func sendMessage() {
        guard !inputText.isEmpty else { return }
        
        let userMessage = CreateChatCompletionRequestMessagesInner(role: "user", content: inputText)
        messages.append(userMessage)
        inputText = ""

        let request = CreateChatCompletionRequest(
            model: "gpt-4o-mini",
            messages: messages,
            maxTokens: 300,
            temperature: 0.7,
            topP: 0.9
        )
        
        DefaultAPI.createChatCompletion(createChatCompletionRequest: request) { [weak self] response, error in
            guard let self = self, let response = response else {
                if let error = error {
                    DispatchQueue.main.async {
                        self?.messages.append(CreateChatCompletionRequestMessagesInner(role: "system", content: "❗️Error: \(error.localizedDescription)"))
                    }
                }
                return
            }
            
            if let completion = response.choices?.first?.message?.content {
                DispatchQueue.main.async {
                    let gptMessage = CreateChatCompletionRequestMessagesInner(role: "assistant", content: completion)
                    self.messages.append(gptMessage)
                }
            }
        }
    }
}
