//
//  wb_chat_2App.swift
//  wb_chat_2
//
//  Created by Aleksandra Nikiforova on 10/08/24.
//

import SwiftUI
import UISystem

@main
struct wb_chat_2App: App {
    
    init() {
        SFProDisplayFont.registerFonts()
    }
    
    var body: some Scene {
        WindowGroup {
            CodeVerificationView(codeCountry: "+7", phoneNumber: "999 99-99-99")
        }
    }
}
