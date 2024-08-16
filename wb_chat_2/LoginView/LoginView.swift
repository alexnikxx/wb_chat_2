//
//  LoginView.swift
//  WB
//
//  Created by Aleksandra Nikiforova on 25/07/24.
//

import SwiftUI
import UISystem

struct LoginView: View {
    @EnvironmentObject var router: Router
    @State private var phone: String = ""
    @State private var selectedCountryCode: Country = Country.countries.first!
    @State private var attempts: Int = 0

    var body: some View {
        BackgroundView {
            VStack {
                OnboardingInfo(
                    title: "Введите номер телефона",
                    info: """
                    Мы вышлем код подтверждения
                    на указанный номер
                    """
                )

                PhoneTextFieldView(phone: $phone, selectedCountryCode: $selectedCountryCode)
                .font(.bodyText1(.semiBold))
                .padding()
                .modifier(ShakeAnimation(animatableData: CGFloat(attempts)))

                Spacer()

                WBButton(text: "Продолжить") {
                    if phone.count == 13 {
                        router.navigateTo(.verification(phoneNumber: phone, code: selectedCountryCode.code))
                    } else {
                        attempts += 1
                    }
                }
                .padding(.bottom, 60)
                .opacity(phone.count == 13 ? 1 : 0.5)
            }
            .navigationBarItems(leading: WBBackButton(action: router.navigateBack))
        }
    }
}

#Preview {
    LoginView()
        .environmentObject(Router.init())
}
