//
//  File.swift
//  
//
//  Created by Aleksandra Nikiforova on 15/08/24.
//

import SwiftUI

public struct WBTextField: View {
    let placeholder: String
    var text: Binding<String>

    public init(placeholder: String, text: Binding<String>) {
        self.placeholder = placeholder
        self.text = text
    }

    public var body: some View {
        TextField(placeholder, text: text)
            .padding(.horizontal, 8)
            .padding(.vertical, 10)
            .frame(maxWidth: .infinity, alignment: .leading)
            .foregroundStyle(Color.CustomColors.heading2)
            .background(Color.CustomColors.textfield)
            .clipShape(RoundedRectangle(cornerRadius: 4))
            .font(.bodyText1)
    }
}
