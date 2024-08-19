//
//  StoriesView.swift
//  wb_chat_2
//
//  Created by Aleksandra Nikiforova on 19/08/24.
//

import SwiftUI

struct StoriesView: View {
    let contacts = Contacts.contacts

    var body: some View {
        let contactsWithStories = contacts.filter { $0.haveStories }

        HStack(spacing: 16) {
            AddStoryView()
            ForEach(contactsWithStories, id: \.self) { contact in
                VStack(spacing: 8) {
                    AvatarView(contact: contact)
                    Text(contact.name)
                        .font(.metadat1(.regular))
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 24)
        .padding(.vertical, 16)
    }
}

#Preview {
    StoriesView()
}
