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
        HStack(spacing: 12) {
            AvatarView(contact: contact)

            VStack(alignment: .leading, spacing: 2) {
                Text(contact.fullname)
                    .font(.bodyText1(.semiBold))
                    .foregroundStyle(Color.CustomColors.heading2)
                    .frame(height: 24)

                Text(contact.onlineStatusMessage)
                    .font(.metadat1(.regular))
                    .foregroundStyle(Color.CustomColors.metadata2)
                    .frame(height: 20)

                Spacer()
            }
            Spacer()
        }
        .frame(height: 56)
    }
}

struct AvatarView: View {
    let contact: Contact

    var body: some View {
        ZStack {
            if contact.haveStories {
                if contact.avatar != nil {
                    strokeForStories(gradient: Color.gradient.style1, startPoint: .leading, endPoint: .trailing)
                } else {
                    strokeForStories(gradient: Color.gradient.style2, startPoint: .topLeading, endPoint: .bottomTrailing)
                }
            }

            if let uiImage = contact.avatarImage {
                Image(uiImage: uiImage)
                
                    .resizable()
                    .scaledToFill()
                    .frame(width: 48, height: 48)
                    .cornerRadius(16)
            } else {
                Text(initials(from: contact.fullname))
                    .foregroundStyle(.white)
                    .frame(width: 48, height: 48)
                    .background(Color.CustomColors.mainWbColor)
                    .cornerRadius(16)
            }

            contact.onlineStatusMessage == "Online" ? setStatus().position(x: 48, y: 6) : nil
        }
        .frame(width: 56, height: 56)
    }

//    private func setStories() -> some View {
//        RoundedRectangle(cornerRadius: 18)
//            .fill(LinearGradient(
//                gradient: Gradient(colors: [Color.CustomColors.mainWbColor, Color.CustomColors.metadata2]),
//                startPoint: .leading,
//                endPoint: .trailing))
//            .frame(width: 56, height: 56)
//    }

//    private func setImage() -> some View {
//        if let image = contact.avatar {
//            return AnyView(
//                Image(image)
//                .resizable()
//                .frame(width: 48, height: 48)
//                .overlay(
//                    RoundedRectangle(cornerRadius: 14)
//                    .stroke(Color.CustomColors.background, lineWidth: 2)
//                )
//            )
//        } else {
//            let nameInitials = contact.name.first
//            let surnameInitials = contact.surname?.first ?? Character(" ")
//            let initials = "\(nameInitials ?? Character(" "))\(surnameInitials)"
//
//            return AnyView(
//                RoundedRectangle(cornerRadius: 16)
//                    .fill(Color.CustomColors.mainWbColor)
//                    .stroke(Color.CustomColors.background, lineWidth: 2)
//                    .frame(width: 48, height: 48)
//                    .overlay(
//                        Text(initials)
//                            .foregroundColor(.white)
//                            .font(.bodyText1(.semiBold))
//                    )
//            )
//        }
//    }

    private func setStatus() -> some View {
        Circle()
            .stroke(Color.white, lineWidth: 4)
            .fill(Color.green)
            .frame(width: 12, height: 12)
    }
}

//#Preview {
//    ContactRowView(contact: Contact(name: "Anne", surname: "Das", avatar: "Анастасия Иванова", phoneNumber: "+456", onlineStatus: .now, haveStories: true, hasMessages: false, socialMediaLinks: [SocialMedia(name: .facebook, link: "fgg", image: "fff")]))
//}
