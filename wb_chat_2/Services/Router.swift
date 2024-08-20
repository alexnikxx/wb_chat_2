//
//  Routing.swift
//  wb_chat_2
//
//  Created by Tatiana Lazarenko on 8/14/24.
//

import SwiftUI
import UISystem

enum Route: Hashable {
    case onboarding
    case authorization
    case verification(phoneNumber: String, code: String)
    case main
    case registration
    case newContact
    case editContact(contact: Contact)
    case contactDetails(contact: Contact)
    case chatWithContact(contact: Contact)
    case gptChat(chat: Chat)
}

@MainActor
final class Router: ObservableObject {
    @Published var startScreen: Route = .onboarding
    @Published var selectedTabRoute: Tab = .chats
    
    @Published var path = NavigationPath()
    
    
    @ViewBuilder func tabView(for route: Tab) -> some View {
        ZStack(alignment: .bottom) {
            VStack(spacing: 0) {
                Spacer()
                switch selectedTabRoute {
                case .contacts:
                    ContactsView()
                        .navigationBarBackButtonHidden()
                case .chats:
                    ChatsView()
                        .navigationBarBackButtonHidden()
                case .settings:
                    SettingsView()
                        .navigationBarBackButtonHidden()
                }
                Spacer()
            }
            
            WBTabBar()
        }
        .ignoresSafeArea()
    }
        
    @ViewBuilder func view(for route: Route) -> some View {
            switch route {
            case .onboarding:
                OnboardingView()
                    .navigationBarBackButtonHidden()
            case .authorization:
                LoginView()
                    .navigationBarBackButtonHidden()
            case .verification(let phoneNumber, let countryCode):
                CodeVerificationView(codeCountry: countryCode, phoneNumber: phoneNumber)
                    .navigationBarBackButtonHidden()
            case .main:
                tabView(for: selectedTabRoute)
            case .registration:
                RegistrationView()
                    .navigationBarBackButtonHidden()
            case .newContact:
                NewContactView()
                    .navigationBarBackButtonHidden()
            case .editContact(let contact):
                EditContactView(contact: contact)
                    .navigationBarBackButtonHidden()
            case .contactDetails(let contact):
                DetailScreenView(contact: contact)
                    .navigationBarBackButtonHidden()
            case .chatWithContact(let contact):
                PrivateChatView(contact: contact)
            case .gptChat(let chat):
                GPTChatView(chat: chat)
                    .navigationBarBackButtonHidden()
            }
    }
    
    func navigateTo(_ appRoute: Route) {
        path.append(appRoute)
    }
        
    func navigateBack() {
        path.removeLast()
    }
        
    func popToRoot() {
        path.removeLast(path.count)
    }
}


