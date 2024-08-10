//
//  OnboardingInfo.swift
//  WB
//
//  Created by Aleksandra Nikiforova on 29/07/24.
//

import SwiftUI

struct OnboardingInfo: View {
    let title: String
    let info: String

    var body: some View {
        VStack(spacing: 12) {
            Text(title)
                .font(.appTitle)

            Text(info)
                .font(.appSmallText.weight(.regular))
                .lineSpacing(8)
        }
        .multilineTextAlignment(.center)
        .foregroundStyle(.text)
        .padding(.bottom, 40)
        .padding(.top, 80)
    }
}

#Preview {
    OnboardingInfo(
        title: "Введите номер телефона",
        info: """
            Мы вышлем код подтверждения
            на указанный номер
            """
    )
}
