//
//  ChatViewModel.swift
//  wb_chat_2
//
//  Created by Halil Yavuz on 21.08.2024.
//

import Foundation


import SwiftUI
import Combine
import ExyteChat
import SwiftData

final class ChatViewModel: ObservableObject {
    @Published var messages: [MockMessage] = []
    private let chatId: UUID
    private let currentUser = MockUser(id: "1", role: .user, lastVisit: Date(), imageName: AssetExtractor.createLocalUrl(forImageNamed: "userBig") ?? URL(string: ""))
    private var chatMessages: [UUID: [MockMessage]] = [:]

    init(chatId: UUID) {
        self.chatId = chatId
    }

    func loadMockMessages(modelContext: ModelContext) {
        if let messagesForChat = chatMessages[chatId] {
            self.messages = messagesForChat
        } else {
            let mockMessages = createMockMessages(for: chatId, modelContext: modelContext)
            chatMessages[chatId] = mockMessages
            self.messages = mockMessages
        }
    }

    func sendMessage(draftMessage: DraftMessage, modelContext: ModelContext) {
        let newMessage = MockMessage(
            uid: UUID().uuidString,
            sender: currentUser,
            createdAt: draftMessage.createdAt,
            text: draftMessage.text

        )

        modelContext.insert(newMessage)
        do {
            try modelContext.save()
        } catch {
            print("Failed to save message: \(error.localizedDescription)")
        }
        DispatchQueue.main.async {
            self.messages.append(newMessage)
            self.chatMessages[self.chatId]?.append(newMessage)
        }

    }

    private func createMockMessages(for chatId: UUID ,modelContext: ModelContext) -> [MockMessage] {
        let user2 = MockUser(id: "2", role: .assistant, lastVisit: Date(), imageName: nil)
        let messagesCount = Int.random(in: 1...4)
        var messages: [MockMessage] = []

        for _ in 0..<messagesCount {
            let sender = user2
            let randomTime = Date().addingTimeInterval(-Double.random(in: 0...3600))
            let randomText = "Random message \(Int.random(in: 1...10))"

            let message = MockMessage(
                uid: UUID().uuidString,
                sender: sender,
                createdAt: randomTime,
                text: randomText
            )
            messages.append(message)
            modelContext.insert(message)
        }

        do {
            try modelContext.save()
        } catch {
            print("Failed to save random messages: \(error.localizedDescription)")
        }

        return messages
    }
}

