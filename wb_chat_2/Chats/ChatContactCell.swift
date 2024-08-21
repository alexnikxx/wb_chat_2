//
//  ChatCell.swift
//  wb_chat_2
//
//  Created by Aleksandra Nikiforova on 19/08/24.
//

import SwiftUI
import UISystem

struct ChatContactCell: View {
    var contact: Contact
    var lastMessage: String

    var body: some View {
        HStack(spacing: 12) {
            AvatarView(contact: contact)

            VStack(alignment: .leading, spacing: 8) {
                Text(contact.fullname)
                    .font(.bodyText1(.semiBold))
                    .foregroundStyle(Color.CustomColors.heading2)

                Text(lastMessage)
                    .font(.bodyText2(.regular))
                    .foregroundStyle(Color.CustomColors.metadata2)
            }

            Spacer()
        }
    }
}

#Preview {
    ChatContactCell(contact: Contacts.contacts[0], lastMessage: "че каво")
}
