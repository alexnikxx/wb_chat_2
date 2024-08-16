//
//  DetailScreenView.swift
//  wb_chat_2
//
//  Created by Азамат Баев on 14.08.2024.
//

import SwiftUI
import UISystem

struct DetailScreenView: View {
    @EnvironmentObject var router: Router
    @Environment (\.dismiss) private var dismiss
    let contact: Contact
   
    var body: some View {
        VStack {
            WBNavigationBar(
                title: "Контакты",
                isBackButton: true,
                rightButtonIcon: "pensil",
                rightButtonAction: { router.navigateTo(.editContact(contact: contact)) },
                backButtonAction: { router.navigateBack() }
            )

            VStack(spacing: 0) {
                if let avatar = contact.avatar {
                    Image(avatar)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 200, height: 200)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.gray, lineWidth: 1))
                        .padding(.top, 86)

                    Text(contact.name)
                        .font(.heading2(.semiBold))
                        .padding(.top, 20)

                    Text(contact.phoneNumber)
                        .font(.metadat1(.regular))
                        .padding(.top, 6)
                } else {
                    RoundedRectangle(cornerRadius: 1)

                        .fill(Color.button)
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 200, height: 200)
                        .clipShape(Circle())
                        .padding(.top, 86)

                        .overlay(
                            Text(initials(from: contact.fullname) )
                                .font(.heading1(.bold, size: 44))
                                .padding(.top, 90)
                                .foregroundColor(.white) )
                        .padding(.trailing, 12)
                    Text(contact.fullname)
                        .font(.heading2(.semiBold))
                        .font(.system(size: 24, weight: .semibold, design: .none))
                        .padding(.top, 20)
                    Text(contact.phoneNumber)
                        .font(.metadat1(.regular, size: 16))
                        .foregroundColor(.body1)
                        .padding(.top, 6)
                }

                HStack(spacing: 12) {
                    SocialButton(socialMedia: .facebook, link: contact.socialMediaLinks[.facebook] ?? "")
                    SocialButton(socialMedia: .instagram, link: contact.socialMediaLinks[.instagram] ?? "")
                    SocialButton(socialMedia: .linkedIn, link: contact.socialMediaLinks[.linkedIn] ?? "")
                    SocialButton(socialMedia: .twitter, link: contact.socialMediaLinks[.twitter] ?? "")
                }
                .padding(.top, 20)

                Spacer()
            }
        }
        .edgesIgnoringSafeArea(.top)
    }
}

#Preview {
    DetailScreenView(contact: Contact(name: "Nastya", surname: "Petrova", avatar: nil, phoneNumber: "575757", onlineStatus: .now, haveStories: true, socialMediaLinks: [.facebook: "lseihckjsndcnd"]))
        .environmentObject(Router.init())
}
