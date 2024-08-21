//
//  StoriesView.swift
//  wb_chat_2
//
//  Created by Aleksandra Nikiforova on 19/08/24.
//

import SwiftUI
import SwiftData
struct StoriesView: View {
    @Query let contacts: [Contact]

    var body: some View {
        let contactsWithStories = contacts.filter { $0.haveStories }

        ScrollView(.horizontal, showsIndicators: false) {
        HStack(spacing: 16) {
                AddStoryView()
                ForEach(contactsWithStories, id: \.self) { contact in
                    VStack(spacing: 8) {
                        AvatarView(contact: contact)
                        Text(contact.name)
                            .font(.metadata2)
                    }
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
