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
    
    init() {
        SFProDisplayFont.registerFonts()
    }
    
    var body: some Scene {
        WindowGroup {
            ContactsView()
                .modelContainer(for: [Contact.self, SocialMedia.self])
        }
    }
}
