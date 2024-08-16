//
//  EditProfileView.swift
//  wb_chat_2
//
//  Created by Aleksandra Nikiforova on 16/08/24.
//

import SwiftUI
import UISystem

struct EditContactView: View {
    @EnvironmentObject var router: Router
    @FocusState private var keyboardFocused: Bool

    @State var contact: Contact

    var body: some View {
        BackgroundView {
            VStack {
                WBNavigationBar(
                    title: "Профиль",
                    isBackButton: true,
                    rightButtonIcon: "",
                    backButtonAction: { router.navigateBack() }
                )

                VStack(spacing: 16) {
                    VStack(spacing: 30) {
                        EditAvatarView()
                            .padding(.top, 46)
                        NameTextFieldsView(name: $contact.name, surname: $contact.surname.withDefault(""))
                    }
                    Divider()
                    VStack(spacing: 16) {
                        ForEach(SocialMediaPlatform.allCases, id: \.rawValue) { platform in
                            WBTextField(placeholder: platform.placeholder, text: $contact.socialMediaLinks[platform].withDefault(""))
                        }
                    }
                }
                .padding(.horizontal, 24)

                Spacer()

                WBButton(text: "Сохранить") {
                    if !contact.name.isEmpty {
                        router.navigateTo(.main)
                    } else {

                    }
                }
                .opacity(!contact.name.isEmpty ? 1 : 0.5)
                .padding(.bottom, 16)
            }
            .edgesIgnoringSafeArea(.top)
            .frame(maxHeight: .infinity, alignment: .top)
        }
    }
}

#Preview {
    EditContactView(contact: Contacts.contacts[0])
        .environmentObject(Router.init())
}
