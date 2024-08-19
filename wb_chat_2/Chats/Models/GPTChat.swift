//
//  GPTChat.swift
//  wb_chat_2
//
//  Created by Tatiana Lazarenko on 8/19/24.
//

import Foundation

struct Chat: Identifiable, Hashable {
    let id: UUID
    var title: String
    var messages: [MockMessage]

    init(id: UUID = UUID(), title: String, messages: [MockMessage] = []) {
        self.id = id
        self.title = title
        self.messages = messages
    }
}
