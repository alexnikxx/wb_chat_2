//
//  LoginView.swift
//  WB
//
//  Created by Aleksandra Nikiforova on 25/07/24.
//

import SwiftUI
import UISystem

struct LoginView: View {
    @StateObject var viewModel = OnboardingViewModel()
    @EnvironmentObject var router: Router
    @FocusState private var keyboardFocused: Bool

    var body: some View {
        BackgroundView {
            VStack {
                OnboardingInfo(
                    title: LocalizedStrings.Login.enterPhoneNumber,
                    info: LocalizedStrings.Login.conformationPhoneMessage
                )

                PhoneTextFieldView(phone: $viewModel.phone, selectedCountry: $viewModel.selectedCountry)
                    .padding()
                    .modifier(ShakeAnimation(animatableData: CGFloat(viewModel.attempts)))
                    .focused($keyboardFocused)

                Spacer()

                WBButton(text: LocalizedStrings.Login.continueButton) {
                    if viewModel.phone.count == 13 {
                        router.navigateTo(.verification(phoneNumber: viewModel.phone, code: viewModel.selectedCountry.code))
                    } else {
                        withAnimation {
                            viewModel.attempts += 1
                        }
                    }
                }
                .padding(.bottom, 60)
                .opacity(viewModel.phone.count == 13 ? 1 : 0.5)
            }
            .navigationBarItems(leading: WBBackButton(action: router.navigateBack))
        }
        .onAppear {
            keyboardFocused = true
        }
        .onTapGesture {
            viewModel.hideKeyboard()
        }
    }
}

#Preview {
    LoginView()
        .environmentObject(Router.init())
}
