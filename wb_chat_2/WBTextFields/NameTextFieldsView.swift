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

    var body: some View {
        VStack(spacing: 12) {
            WBTextField(placeholder: "Имя (обязательно)", text: $name)
            WBTextField(placeholder: "Фамилия (опционально)", text: $surname)
        }
        .padding(.horizontal)
    }
}
