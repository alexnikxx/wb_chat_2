//
//  NewContactView.swift
//  wb_chat_2
//
//  Created by Aleksandra Nikiforova on 16/08/24.
//

import SwiftUI
import UISystem
import SwiftData

struct NewContactView: View {
    @EnvironmentObject var router: Router
    @FocusState private var keyboardFocused: Bool

    @StateObject private var viewModel = NewContactViewModel()
    @Environment(\.modelContext) private var modelContext: ModelContext
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        BackgroundView {
            VStack {
                WBNavigationBar(
                    title: LocalizedStrings.newContactTittle,
                    isBackButton: true,
                    rightButtonIcon: "",
                    backButtonAction: { router.navigateBack() }
                )

                VStack(spacing: 16) {
                    VStack(spacing: 30) {
                        EditAvatarView(selectedImage: $viewModel.selectedImage)
                            .padding(.top, 46)
                        NameTextFieldsView(name: $viewModel.name, surname: $viewModel.surname)
                            .modifier(ShakeAnimation(animatableData: CGFloat(viewModel.attempts)))
                            .overlay(
                                viewModel.nameError ? showErrorForName() : nil
                            )
                    }

                    Divider()
                    PhoneTextFieldView(phone: $viewModel.phoneNumber, selectedCountry: $viewModel.selectedCountry)
                        .modifier(ShakeAnimation(animatableData: CGFloat(viewModel.attempts)))
                        .overlay(
                            viewModel.nameError ? showErrorForPhone() : nil
                        )

                    Divider()
                    SocialMediaTextFieldsView(
                        twitter: $viewModel.twitter,
                        instagram: $viewModel.instagram,
                        linkedin: $viewModel.linkedin,
                        facebook: $viewModel.facebook
                    )
                }
                .padding(.horizontal, 24)

                Spacer()

                WBButton(text: LocalizedStrings.saveButton) {
                    viewModel.saveContact(modelContext: modelContext, dismiss: {
                        dismiss()
                    })
                }

                .padding(.bottom, 16)
            }
            .edgesIgnoringSafeArea(.top)
            .frame(maxHeight: .infinity, alignment: .top)
        }
    }

    private func showErrorForName() -> some View {
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
        .padding(.bottom, 50)
    }

    private func showErrorForPhone() -> some View {
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
    }
}

#Preview {
    NewContactView()
        .environmentObject(Router.init())
}
