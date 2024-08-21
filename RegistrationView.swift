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
    @StateObject private var viewModel = RegistrationViewModel()
    @EnvironmentObject var router: Router

    @Environment(\.modelContext) private var modelContext: ModelContext
    @AppStorage("isRegistered") private var isRegistered: Bool = false

    var body: some View {
        BackgroundView {
            VStack(spacing: 30) {
                EditAvatarView(selectedImage: $viewModel.selectedImage)

                NameTextFieldsView(name: $viewModel.name, surname: $viewModel.surname)
                    .padding(.horizontal, 24)
                    .modifier(ShakeAnimation(animatableData: CGFloat(viewModel.attempts)))
                    .overlay(
                        viewModel.nameError ? showError() : nil
                    )

                Spacer()

                WBButton(text: LocalizedStrings.saveButton) {
                    if viewModel.checkValidation() {
                        viewModel.saveUser(modelContext: modelContext)
                        isRegistered = true
                        router.navigateTo(.main)
                    }
                }
                .opacity(!viewModel.name.isEmpty ? 1 : 0.5)
                .padding(.bottom, 16)
            }
            .padding(.top, 90)
        }
        .onTapGesture {
            viewModel.hideKeyboard()
        }
    }

    private func showError() -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 5)
                .stroke(Color.accent.danger)

            Text(LocalizedStrings.Registration.requiredField)
                .font(.metadata1)
                .foregroundStyle(Color.accent.danger)
                .padding(.trailing, 8)
                .frame(maxWidth: .infinity, alignment: .trailing)
        }
        .modifier(ShakeAnimation(animatableData: CGFloat(viewModel.attempts)))
        .animation(.easeInOut, value: viewModel.nameError)
        .padding(.bottom, 50)
        .padding(.horizontal, 24)
    }
}

#Preview {
    RegistrationView()
        .environmentObject(Router.init())
}
