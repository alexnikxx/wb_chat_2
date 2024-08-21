//
//  NameTextFieldsView.swift
//  wb_chat_2
//
//  Created by Aleksandra Nikiforova on 16/08/24.
//

import SwiftUI
import UISystem

struct NameTextFieldsView: View {
    @Binding var name: String
    @Binding var surname: String
    @FocusState private var keyboardFocused: Bool

    var body: some View {
        VStack(spacing: 12) {
            WBTextField(placeholder: LocalizedStrings.Registration.nameTF, text: $name)
                .focused($keyboardFocused)
                .onAppear {
                    keyboardFocused = true
                }
            WBTextField(placeholder: LocalizedStrings.Registration.surnameTF, text: $surname)
        }
    }
}
