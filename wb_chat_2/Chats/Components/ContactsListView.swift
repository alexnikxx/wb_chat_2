//
//  ContactsListView.swift
//  wb_chat_2
//
//  Created by Aleksandra Nikiforova on 21/08/24.
//

import SwiftUI
import SwiftData

struct ContactsListView: View {
    @Environment(\.dismiss) var dismiss
    @Query var contacts: [Contact]
    var onSelect: (Contact) -> Void

    var body: some View {
        NavigationView {
            List(contacts, id: \.id) { contact in
                Button(action: {
                    onSelect(contact)
                    dismiss()
                }) {
                    Text(contact.fullname)
                }
            }
            .navigationBarTitle("Выберите контакт", displayMode: .inline)
        }
    }
}
