//
//  ChatInteractorProtocol.swift
//  wb_chat_2
//
//  Created by Tatiana Lazarenko on 8/18/24.
//

import Foundation
import Combine
import ExyteChat

protocol ChatInteractorProtocol {
    var messages: AnyPublisher<[MockMessage], Never> { get }
    var senders: [MockUser] { get }
    var otherSenders: [MockUser] { get }

    func send(draftMessage: ExyteChat.DraftMessage)

    func connect()
    func disconnect()

    func loadNextPage() -> Future<Bool, Never>
}
