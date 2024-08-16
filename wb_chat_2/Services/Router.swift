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
    case contactDetails(contact: Contact)
}

@MainActor
final class Router: ObservableObject {
    @Published var startScreen: Route = .onboarding
    @Published var selectedTabRoute: Tab = .contacts
    
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
            case .main:
                tabView(for: selectedTabRoute)
            case .verification(let phoneNumber, let countryCode):
                CodeVerificationView(codeCountry: countryCode, phoneNumber: phoneNumber)
                    .navigationBarBackButtonHidden()
            case .contactDetails(let contact):
                DetailScreenView(contact: contact)
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


