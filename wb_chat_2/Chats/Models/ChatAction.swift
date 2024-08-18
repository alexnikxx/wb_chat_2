//
//  ChatAction.swift
//  wb_chat_2
//
//  Created by Tatiana Lazarenko on 8/18/24.
//

import SwiftUI
import ExyteChat

enum ActionChat: MessageMenuAction {
    case reply, delete

    func title() -> String {
        switch self {
        case .reply:
            "Reply"
        case .delete:
            "Delete"
        }
    }
    
    func icon() -> Image {
        switch self {
        case .reply:
            Image(systemName: "arrowshape.turn.up.left")
        case .delete:
            Image(systemName: "xmark.bin.fill")
        }
    }
}
