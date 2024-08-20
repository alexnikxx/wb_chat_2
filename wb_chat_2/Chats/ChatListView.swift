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
                    .listRowSeparatorTint(Color.CustomColors.textfield)
                    .alignmentGuide(.listRowSeparatorLeading) { _ in 0 }
                    .alignmentGuide(.listRowSeparatorTrailing) { separator in
                        separator.width - 2
                    }
                    .padding(5)
                    .onTapGesture {
                        router.navigateTo(.contactDetails(contact: contact))
                    }
            }
            .listStyle(.plain)
        }
    }
}
