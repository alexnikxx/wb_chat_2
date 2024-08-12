//
//  File.swift
//  
//
//  Created by Aleksandra Nikiforova on 12/08/24.
//

import SwiftUI

public struct WBButton: View {
    public var text: String
    public var color: Color
    public var isDisabled: Bool
    public var isFilled: Bool = true
    public var action: () -> Void

    public init(
        text: String,
        color: Color = Color("button"),
        isDisabled: Bool = false,
        isFilled: Bool = true,
        action: @escaping () -> Void
    ) {
        self.text = text
        self.action = action
        self.color = color
        self.isDisabled = isDisabled
        self.isFilled = isFilled
    }

    public var body: some View {
        Button(action: action) {
            HStack {
                Spacer()
                Text(text)
                    .font(.sfProDisplay(.semiBold, size: 16))
                    .foregroundColor(isFilled ? .white : color)
                    .padding(
                        EdgeInsets(
                            top: 12,
                            leading: isFilled ? 48 : 30,
                            bottom: 12,
                            trailing: isFilled ? 48 : 30
                        )
                    )
                Spacer()
            }
        }
        .padding(.vertical, 8)
        .background(isFilled ? (isDisabled ? color.opacity(0.5) : color) : Color.clear)
        .cornerRadius(30)
        .disabled(isDisabled)
        .padding(.horizontal, 24)
    }
}
