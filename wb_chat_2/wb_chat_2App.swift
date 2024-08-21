//
//  wb_chat_2App.swift
//  wb_chat_2
//
//  Created by Aleksandra Nikiforova on 10/08/24.
//

import SwiftUI
import UISystem
import SwiftData

@main
struct wb_chat_2App: App {
    @StateObject private var viewModelGPT = GPTViewModel()
    @AppStorage("darkMode") private var darkMode = false
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: [User.self, Contact.self, SocialMedia.self, Chat.self, MockMessage.self])
                .preferredColorScheme(darkMode ? .dark : .light)
        }
        .environmentObject(viewModelGPT)
    }
}
