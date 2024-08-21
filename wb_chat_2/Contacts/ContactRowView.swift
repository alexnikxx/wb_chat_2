//
//  ContactsRowView.swift
//  wb_chat_2
//
//  Created by Tatiana Lazarenko on 8/10/24.
//

import SwiftUI
import UISystem

struct ContactRowView: View {
    let contact: Contact

    var body: some View {
        VStack(spacing: 14) {
            HStack(spacing: 12) {
                AvatarView(contact: contact)

                VStack(alignment: .leading, spacing: 2) {
                    Text(contact.fullname)
                        .font(.bodyText1)
                        .foregroundStyle(Color.CustomColors.heading2)
                        .frame(height: 24)

                    Text(contact.onlineStatusMessage)
                        .font(.metadata2)
                        .foregroundStyle(Color.CustomColors.metadata2)
                        .frame(height: 20)

                    Spacer()
                }

                Spacer()
            }
            .frame(height: 56)

            Rectangle()
                .frame(height: 1)
                .frame(maxWidth: .infinity)
                .foregroundStyle(Color.CustomColors.smallElements)
        }
    }
}
