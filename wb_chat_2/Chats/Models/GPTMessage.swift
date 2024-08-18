//
//  GPTMessage.swift
//  wb_chat_2
//
//  Created by Tatiana Lazarenko on 8/18/24.
//

import Foundation

import ExyteChat

struct MockMessage {
    let uid: String
    let sender: MockUser
    let createdAt: Date
    let text: String
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
