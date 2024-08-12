//
//  Testing.swift
//  wb_chat_2
//
//  Created by Tatiana Lazarenko on 8/12/24.
//

import Foundation
import OpenAIAPI

struct TestingAPI {
    func performChatCompletion() {
        
        // Создаем запрос с моделью, сообщением и другими параметрами
        let model = "gpt-4o-mini"
        let messages = [CreateChatCompletionRequestMessagesInner(role: "user", content: "Привет! Как дела?")]
        let requestBody = CreateChatCompletionRequest(
            model: model,
            messages: messages,
            maxTokens: 50,
            temperature: 0.7,
            topP: 0.9
        )
        
        // Отправляем запрос с использованием метода createChatCompletion
        DefaultAPI.createChatCompletion(createChatCompletionRequest: requestBody) { response, error in
            if let error = error {
                print("Ошибка отправления запроса: \(error.localizedDescription)")
                return
            }
            
            // Проверяем и выводим ответ от OpenAI API
            if let choices = response?.choices, let firstChoice = choices.first {
                print("OpenAI Response: \(firstChoice.message?.content ?? "No response")")
            } else {
                print("No choices in the response.")
            }
        }
    }
}
