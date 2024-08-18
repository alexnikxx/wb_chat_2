//
//  ChatError.swift
//  wb_chat_2
//
//  Created by Tatiana Lazarenko on 8/18/24.
//

import Foundation

enum ChatError: Error {
    case unknown(source: Error?)
}
