//
//  LoginView.swift
//  WB
//
//  Created by Aleksandra Nikiforova on 25/07/24.
//

import SwiftUI

struct LoginView: View {
    @FocusState private var keyboardFocused: Bool
    @State var phone: String = ""
    @State var color = Color.text
    @State var attempts: Int = 0

    var body: some View {
        VStack {
            OnboardingInfo(
                title: "Введите номер телефона",
                info: """
                    Мы вышлем код подтверждения
                    на указанный номер
                    """
            )

            HStack {
                HStack {
                    Image("ru")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 16, height: 16)
                        .clipShape(RoundedRectangle(cornerRadius: 4))
                    Text("+7")
                }
                .padding(8)
                .foregroundStyle(.text)
                .background(Color.searchBackground)
                .clipShape(RoundedRectangle(cornerRadius: 4))

                TextField("000 000-00-00", text: $phone)
                    .padding(8)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundStyle(color)
                    .background(Color.searchBackground)
                    .clipShape(RoundedRectangle(cornerRadius: 4))
                    .keyboardType(.decimalPad)
                    .focused($keyboardFocused)
                    .onAppear {
                        keyboardFocused = true
                    }
                    .onChange(of: phone) {
                        if !phone.isEmpty {
                            phone = phone.formatDigits(mask: "XXX XXX-XX-XX")
                            color = .text
                        }
                    }
            }
            .font(.appSmallText)
            .padding()
            .padding(.bottom, 60)
            .modifier(ShakeAnimation(animatableData: CGFloat(attempts)))

            if phone.count == 13 {
                NavigationLink {

                } label: {
                    Text("Продолжить")
                        .modifier(ButtonModifier())
                }
                .buttonStyle(.plain)
            } else {
                Button {
                    withAnimation {
                        attempts += 1
                    }
                } label: {
                    Text("Продолжить")
                        .modifier(ButtonModifier())
                }
                .buttonStyle(.plain)
                .opacity(phone.count == 13 ? 1 : 0.5)
            }

            Spacer()
        }
        .modifier(BackgroundModifier())
        .navigationBarBackButtonHidden()
        .navigationBarItems(leading: CustomBackButton())
    }
}

#Preview {
    LoginView()
}
