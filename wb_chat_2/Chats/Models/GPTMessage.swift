//
//  GPTMessage.swift
//  wb_chat_2
//
//  Created by Tatiana Lazarenko on 8/18/24.
//

import Foundation
import ExyteChat
import SwiftData

@Model
class MockMessage: Hashable {
    let uid: String
    let sender: MockUser
    let createdAt: Date
    let text: String
    init(uid: String, sender: MockUser, createdAt: Date, text: String) {
        self.uid = uid
        self.sender = sender
        self.createdAt = createdAt
        self.text = text
    }
}

extension MockMessage {
    func toChatMessage() -> ExyteChat.Message {
        ExyteChat.Message(
            id: uid,
            user: sender.toChatUser(),
            createdAt: createdAt,
            text: text
        )
    }
}
