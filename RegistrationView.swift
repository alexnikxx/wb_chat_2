//
//  RegistrationView.swift
//  wb_chat_2
//
//  Created by Aleksandra Nikiforova on 15/08/24.
//

import SwiftUI
import UISystem

struct RegistrationView: View {
    @EnvironmentObject var router: Router
    @FocusState private var keyboardFocused: Bool
    @State var name: String = ""
    @State var surname: String = ""

    var body: some View {
        BackgroundView {
            VStack(spacing: 30) {
                EditAvatarView()
                    .padding(.top, 46)
                NameTextFieldsView(name: $name, surname: $surname)
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
        }
        .navigationBarItems(leading: WBBackButton(action: router.navigateBack))
    }
}

#Preview {
    RegistrationView()
        .environmentObject(Router.init())
}
