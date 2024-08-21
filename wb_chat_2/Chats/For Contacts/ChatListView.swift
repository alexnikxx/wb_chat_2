//
//  ChatListView.swift
//  wb_chat_2
//
//  Created by Aleksandra Nikiforova on 19/08/24.
//

import SwiftUI
import UISystem

struct ChatListView: View {
    @EnvironmentObject var router: Router
    var filteredContacts: [Contact]
    var inputText: Binding<String>

    var body: some View {
        VStack {
            WBSearchBarView(inputText: inputText)
                .padding(.horizontal, 24)

            List(filteredContacts, id: \.self) { contact in
                ChatContactCell(contact: contact, lastMessage: "че каво")
                    .listRowBackground(Color.CustomColors.background)
                    .listRowSeparator(.hidden)
                    .onTapGesture {
                        router.navigateTo(.chatWithContact(chatId: contact.id, contact: contact))
                    }
            }
            .listStyle(.plain)
        }
    }
}
