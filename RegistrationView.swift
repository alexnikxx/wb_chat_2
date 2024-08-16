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
    @State var name: String = ""
    @State var surname: String = ""
    @FocusState private var keyboardFocused: Bool

    var body: some View {
        BackgroundView {
            VStack(spacing: 32) {
                Image("user")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 56, height: 56)
                    .padding(22)
                    .background(Color.textfield)
                    .cornerRadius(100)
                    .overlay(
                        Button {

                        } label: {
                            Image(systemName: "plus.circle.fill")
                                .offset(CGSize(width: 37.0, height: 37.0))
                                .frame(width: 24, height: 24)
                                .foregroundStyle(.heading2)
                        }
                    )

                VStack(spacing: 12) {
                    WBTextField(placeholder: "Имя (обязательно)", text: $name)
                    WBTextField(placeholder: "Фамилия (опционально)", text: $surname)
                }
                .padding(.horizontal)
                .padding(.bottom, 56)

                Spacer()

                WBButton(text: "Сохранить") {

                }
                .padding(.bottom, 16)
                .opacity(name.isEmpty ? 0.5 : 1)
            }
            .padding(.top, 46)
            .frame(maxHeight: .infinity, alignment: .top)
            .navigationBarBackButtonHidden()
            .navigationBarItems(leading: WBBackButton(action: router.navigateBack))
        }
    }
}

#Preview {
    RegistrationView(name: "", surname: "")
}
