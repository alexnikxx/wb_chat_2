//
//  GPTChat.swift
//  wb_chat_2
//
//  Created by Tatiana Lazarenko on 8/19/24.
//

import Foundation
import OpenAIAPI

struct Chat: Identifiable, Hashable {
    let id: UUID
    var messages: [MockMessage]

    init(id: UUID = UUID(), messages: [MockMessage] = []) {
        self.id = id
        self.messages = messages
    }
}
