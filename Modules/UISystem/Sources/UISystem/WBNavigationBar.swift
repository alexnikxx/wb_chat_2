//
//  File.swift
//  
//
//  Created by Aleksandra Nikiforova on 12/08/24.
//

import SwiftUI

public struct WBNavigationBar: View {
    public var title: String
    public var isBackButton: Bool
    public var rightButtonIcon: String
    public var textColor: Color
    public var rightButtonAction: (() -> Void)?

    public init(
        title: String,
        isBackButton: Bool,
        rightButtonIcon: String,
        textColor: Color = Color(("heading2")),
        rightButtonAction: (() -> Void)? = nil
    ) {
        self.title = title
        self.isBackButton = isBackButton
        self.rightButtonIcon = rightButtonIcon
        self.textColor = textColor
        self.rightButtonAction = rightButtonAction
    }

    public var body: some View {
        Group {
            ZStack {
                Rectangle()
                    .foregroundStyle(Color("background"))
                    .frame(height: 100)

                HStack {
                    HStack(spacing: 0) {
                        if isBackButton {
                            backButton()
                                .padding(.leading)
                        }

                        title(title)
                    }

                    Spacer()

                    button(iconName: rightButtonIcon) {
                        rightButtonAction?()
                    }
                }
                .frame(height: 100, alignment: .bottom)
            }
        }
        .frame(height: 100, alignment: .bottom)
    }

    public func title(_ text: String) -> some View {
        Text(text)
            .font(.subheading1(.semiBold))
            .foregroundStyle(textColor)
            .padding()
    }

    public func backButton() -> some View {
        WBBackButton()
    }

    public func button(iconName: String, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            Image(iconName)
                .foregroundStyle(Color("heading2"))
                .padding()
        }
    }
}
