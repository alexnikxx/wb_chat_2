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
    public var isButton: Bool = true
    public var action: () -> Void

    public init(
        text: String,
        color: Color = Color.CustomColors.mainWbColor,
        isDisabled: Bool = false,
        isFilled: Bool = true,
        isButton: Bool = true,
        action: @escaping () -> Void
    ) {
        self.text = text
        self.color = color
        self.isDisabled = isDisabled
        self.isFilled = isFilled
        self.isButton = isButton
        self.action = action
    }

    public var body: some View {
        Group {
            Button(text, action: action)
                .buttonStyle(WBButtonStyle(isFilled: isFilled, isDisabled: isDisabled, color: color))
        }
        .padding(.horizontal, 24)
    }
}

public struct WBButtonStyle: ButtonStyle {
    var isFilled: Bool
    var isDisabled: Bool
    var color: Color

    public init(isFilled: Bool, isDisabled: Bool, color: Color) {
        self.isFilled = isFilled
        self.isDisabled = isDisabled
        self.color = color
    }

    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.subheading2(.semiBold))
            .foregroundColor(isFilled ? Color("buttonText") : color)
            .padding()
            .frame(width: UIScreen.main.bounds.width - 48)
            .background(isFilled ? (isDisabled ? color.opacity(0.5) : color) : Color.clear)
            .cornerRadius(30)
            .opacity(configuration.isPressed ? 0.8 : 1.0)
            .disabled(isDisabled)
    }
}


