//
//  GPTUser.swift
//  wb_chat_2
//
//  Created by Tatiana Lazarenko on 8/18/24.
//

import Foundation
import ExyteChat

enum Role: String, Codable {
    case user = "user"
    case assistant = "assistant"
    case system = "system"
}

struct MockUser: Equatable, Hashable, Codable {
    let id: String
    let role: Role
    let lastVisit: Date
    let imageName: URL?
}

extension MockUser {
    var isCurrentUser: Bool {
        id == "1"
    }
}

extension MockUser {
    func toChatUser() -> ExyteChat.User {
        ExyteChat.User(id: id, name: role.rawValue, avatarURL: imageName, isCurrentUser: isCurrentUser)
    }
}
