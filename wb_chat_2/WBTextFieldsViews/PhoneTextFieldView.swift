//
//  PhoneTextFieldView.swift
//  wb_chat_2
//
//  Created by Aleksandra Nikiforova on 16/08/24.
//

import SwiftUI
import UISystem

struct PhoneTextFieldView: View {
    @Binding var phone: String
    @Binding var selectedCountryCode: Country
    @FocusState private var keyboardFocused: Bool

    var body: some View {
        VStack(spacing: 16) {
            HStack {
                CountryView(selectedCountry: $selectedCountryCode)
                WBTextField(placeholder: "000 000-00-00", text: $phone)
                    .keyboardType(.decimalPad)
                    .focused($keyboardFocused)
                    .onAppear {
                        keyboardFocused = true
                    }
                    .onChange(of: phone) {
                        if !phone.isEmpty {
                            phone = phone.formatDigits(mask: "XXX XXX-XX-XX")
                        }
                    }
            }
        }
    }
}
