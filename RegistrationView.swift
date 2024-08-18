//
//  RegistrationView.swift
//  wb_chat_2
//
//  Created by Aleksandra Nikiforova on 15/08/24.
//

import SwiftUI
import UISystem
import SwiftData

struct RegistrationView: View {
    @EnvironmentObject var router: Router
    @FocusState private var keyboardFocused: Bool
    @StateObject private var viewModel = RegistrationViewModel()
    @Environment(\.modelContext) private var modelContext: ModelContext
    @AppStorage("isRegistered") private var isRegistered: Bool = false

    var body: some View {
        BackgroundView {
            VStack(spacing: 30) {
                EditAvatarView(selectedImage: $viewModel.selectedImage)
                    .padding(.top, 46)
                NameTextFieldsView(name: $viewModel.name, surname: $viewModel.surname)
                    .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(viewModel.nameError ? Color.red.opacity(0.5) : Color.clear, lineWidth: 2)
                        .padding(.bottom, 50)
                        .animation(.easeInOut, value: viewModel.nameError))
                .overlay(
                    viewModel.nameError ? Text("Обязательное поле")
                        .font(.caption)
                        .foregroundColor(.red)
                        .padding(.bottom, 50)
                        .padding(.trailing, 40)
                        .frame(maxWidth: .infinity, alignment: .trailing) : nil
                )
                    .padding(.horizontal, 24)

                Spacer()

                WBButton(text: LocalizedStrings.saveButton) {
                    if viewModel.checkValidation() {
                        viewModel.saveUser(modelContext: modelContext)
                        isRegistered = true
                        router.navigateTo(.main)
                    }
                   
                }
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
