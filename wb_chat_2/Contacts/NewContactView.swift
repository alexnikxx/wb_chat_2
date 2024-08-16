//
//  NewContactView.swift
//  wb_chat_2
//
//  Created by Aleksandra Nikiforova on 16/08/24.
//

import SwiftUI
import UISystem

struct NewContactView: View {
    @EnvironmentObject var router: Router
    @FocusState private var keyboardFocused: Bool

    @State var name: String = ""
    @State var surname: String = ""

    @State var phone: String = ""
    @State var countryCode: Country = Country.countries.first!

    @State var twitter: String = ""
    @State var instagram: String = ""
    @State var linkedin: String = ""
    @State var facebook: String = ""


    var body: some View {
        BackgroundView {
            VStack {
                WBNavigationBar(
                    title: "Новый контакт",
                    isBackButton: true,
                    rightButtonIcon: "",
                    backButtonAction: { router.navigateBack() }
                )

                VStack(spacing: 16) {
                    VStack(spacing: 30) {
                        EditAvatarView()
                            .padding(.top, 46)
                        NameTextFieldsView(name: $name, surname: $surname)
                    }
                    Divider()
                    PhoneTextFieldView(phone: $phone, selectedCountryCode: $countryCode)
                    Divider()
                    SocialMediaTextFieldsView(
                        twitter: $twitter,
                        instagram: $instagram,
                        linkedin: $linkedin,
                        facebook: $facebook
                    )
                }
                .padding(.horizontal, 24)

                Spacer()

                WBButton(text: "Сохранить") {
                    if !name.isEmpty {
                        router.navigateTo(.main)
                    } else {

                    }
                }
                .opacity(!name.isEmpty ? 1 : 0.5)
                .padding(.bottom, 16)
            }
            .edgesIgnoringSafeArea(.top)
            .frame(maxHeight: .infinity, alignment: .top)
        }
    }
}

#Preview {
    NewContactView()
        .environmentObject(Router.init())
}
