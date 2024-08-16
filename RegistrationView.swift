//
//  RegistrationView.swift
//  wb_chat_2
//
//  Created by Aleksandra Nikiforova on 15/08/24.
//

import SwiftUI
import UISystem

struct RegistrationView: View {
    @EnvironmentObject var router: Router
    @FocusState private var keyboardFocused: Bool
    @State var name: String = ""
    @State var surname: String = ""

    var body: some View {
        BackgroundView {
            NameTextFieldsView(name: $name, surname: $surname)
        }
    }
}

#Preview {
    RegistrationView()
        .environmentObject(Router.init())
}
