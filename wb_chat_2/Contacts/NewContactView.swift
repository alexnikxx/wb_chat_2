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
                    backButtonAction: { router.navigateBack() }, isSubtitle: false
                )
                
                VStack(spacing: 16) {
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
                    }
                    Divider()
                    PhoneTextFieldView(phone: $viewModel.phoneNumber, selectedCountryCode: $viewModel.selectedCountry)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(viewModel.phoneNumberError ? Color.red.opacity(0.5) : Color.clear, lineWidth: 2)
                                .animation(.easeInOut, value: viewModel.phoneNumber))
                        .overlay(
                            viewModel.phoneNumberError ? Text("Обязательное поле")
                                .font(.caption)
                                .foregroundColor(.red)
                                .padding(.top, 5)
                                .padding(.trailing, 5)
                                .frame(maxWidth: .infinity, alignment: .trailing) : nil
                            
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
}

#Preview {
    NewContactView()
        .environmentObject(Router.init())
}
