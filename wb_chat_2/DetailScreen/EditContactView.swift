//
//  EditProfileView.swift
//  wb_chat_2
//
//  Created by Aleksandra Nikiforova on 16/08/24.
//

import SwiftUI
import UISystem
import SwiftData

struct EditContactView: View {
    @EnvironmentObject var router: Router
    @FocusState private var keyboardFocused: Bool
    @StateObject private var viewModel: EditContactViewModel
    @Environment(\.modelContext) private var modelContext: ModelContext
    init(contact: Contact) {
        _viewModel = StateObject(wrappedValue: EditContactViewModel(contact: contact))
    }
    
    var body: some View {
        BackgroundView {
            VStack {
                WBNavigationBar(
                    title: "Профиль",
                    isBackButton: true,
                    rightButtonIcon: "",
                    backButtonAction: { router.navigateBack() }, isSubtitle: false
                )
                
                VStack(spacing: 16) {
                    VStack(spacing: 30) {
                        EditAvatarView(selectedImage: $viewModel.selectedImage)
                            .padding(.top, 46)
                        NameTextFieldsView(name: $viewModel.contact.name, surname: $viewModel.contact.surname.withDefault(""))
                    }
                    Divider()
                    VStack(spacing: 16) {
                        SocialMediaTextFieldsView(
                            twitter: Binding(
                                get: { viewModel.contact.socialMediaLinks.first(where: { $0.name == "twitter" })?.nickname ?? "" },
                                set: { newValue in
                                    viewModel.updateSocialMedia(name: "twitter", nickname: newValue)
                                }
                            ),
                            instagram: Binding(
                                get: { viewModel.contact.socialMediaLinks.first(where: { $0.name == "instagram" })?.nickname ?? "" },
                                set: { newValue in
                                    viewModel.updateSocialMedia(name: "instagram", nickname: newValue)
                                }
                            ),
                            linkedin: Binding(
                                get: { viewModel.contact.socialMediaLinks.first(where: { $0.name == "linkedin" })?.nickname ?? "" },
                                set: { newValue in
                                    viewModel.updateSocialMedia(name: "linkedin", nickname: newValue)
                                }
                            ),
                            facebook: Binding(
                                get: { viewModel.contact.socialMediaLinks.first(where: { $0.name == "facebook" })?.nickname ?? "" },
                                set: { newValue in
                                    viewModel.updateSocialMedia(name: "facebook", nickname: newValue)
                                }
                            )
                        )
                    }
                }
                .padding(.horizontal, 24)
                
                Spacer()
                
                WBButton(text: LocalizedStrings.saveButton) {
                    viewModel.saveUser(modelContext: modelContext)
                    router.navigateTo(.main)
                }
                .padding(.bottom, 16)
            }
            .edgesIgnoringSafeArea(.top)
            .frame(maxHeight: .infinity, alignment: .top)
        }
    }
}


//#Preview {
//    EditContactView()
//        .environmentObject(Router.init())
//}
