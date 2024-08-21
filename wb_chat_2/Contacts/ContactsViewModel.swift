//
//  ContactsViewModel.swift
//  wb_chat_2
//
//  Created by Tatiana Lazarenko on 8/10/24.
//

import Foundation

final class ContactsViewModel: ObservableObject {
    @Published var navigateToAccountEdit = false
    @Published var showDeleteActionSheet = false
    @Published var showDeleteAlert = false
    @Published var contactToDelete: Contact?
    @Published var inputText = ""
}
