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
    public var backButtonAction: () -> Void
    public var isSubtitle: Bool

    public init(
        title: String,
        isBackButton: Bool,
        rightButtonIcon: String,
        textColor: Color = Color(("heading2")),
        rightButtonAction: (() -> Void)? = nil,
        backButtonAction: @escaping () -> Void,
        isSubtitle: Bool
    ) {
        self.title = title
        self.isBackButton = isBackButton
        self.rightButtonIcon = rightButtonIcon
        self.textColor = textColor
        self.rightButtonAction = rightButtonAction
        self.backButtonAction = backButtonAction
        self.isSubtitle = isSubtitle
    }

    public var body: some View {
        Group {
            ZStack {
                Rectangle()
                    .foregroundStyle(Color("background"))
                    .frame(height: 90)

                HStack(spacing: 0) {
                    if isBackButton {
                        backButton()
                            .padding(.leading)
                    }
                    VStack(alignment: .leading, spacing: 1) {
                        title(title)
                        
                        if isSubtitle {
                            HStack {
                                ProgressView()
                                    .scaleEffect(0.7)
                                    .progressViewStyle(.circular)
                                Text("GPT is typing...")
                                    .font(.system(size: 12))
                                    .italic()
                                    .padding(.leading, 4)
                            }
                            .foregroundStyle(.gray)
                        }
                    }
                    .padding(.leading, isBackButton ? 8 : 24)
                    
                    Spacer()

                    if rightButtonIcon != "" {
                        button(iconName: rightButtonIcon) {
                            rightButtonAction?()
                        }
                    }
                }
                .frame(height: 90, alignment: .bottom)
            }
        }
        .frame(height: 90, alignment: .bottom)
    }

    public func title(_ text: String) -> some View {
        Text(text)
            .font(.subheading1(.semiBold))
            .foregroundStyle(textColor)
    }

    public func backButton() -> some View {
        WBBackButton(action: backButtonAction)
    }

    public func button(iconName: String, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            Image(iconName)
                .resizable()
                .frame(width: 24, height: 24)
                .foregroundStyle(Color("heading2"))
                .padding(.horizontal, 24)
        }
    }
}
