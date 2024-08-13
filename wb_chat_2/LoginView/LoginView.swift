//
//  LoginView.swift
//  WB
//
//  Created by Aleksandra Nikiforova on 25/07/24.
//

import SwiftUI
import UISystem

struct LoginView: View {
    @FocusState private var keyboardFocused: Bool
    @State var phone: String = ""
    @State var color = Color.heading2
    @State var attempts: Int = 0

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

                HStack {
                    CountryView(selectedCountry: Country.countries[0])

                    TextField("000 000-00-00", text: $phone)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 10)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundStyle(color)
                        .background(.textfield)
                        .clipShape(RoundedRectangle(cornerRadius: 4))
                        .keyboardType(.decimalPad)
                        .focused($keyboardFocused)
                        .onAppear {
                            keyboardFocused = true
                        }
                        .onChange(of: phone) {
                            if !phone.isEmpty {
                                phone = phone.formatDigits(mask: "XXX XXX-XX-XX")
                                color = .heading2
                            }
                        }
                }
                .font(.bodyText1(.semiBold))
                .padding()
                .modifier(ShakeAnimation(animatableData: CGFloat(attempts)))

                Spacer()

                WBButton(text: "Продолжить") {
                    if phone.count == 13 {
// Переход на экран верификации
                    } else {
                        attempts += 1
                    }
                }
                .padding(.bottom, 60)
                .opacity(phone.count == 13 ? 1 : 0.5)
            }
            .navigationBarBackButtonHidden()
            .navigationBarItems(leading: WBBackButton())
        }
    }
}

#Preview {
    LoginView()
}
