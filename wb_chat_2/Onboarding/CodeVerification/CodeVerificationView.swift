//
//  CodeVerificationView.swift
//  wb_chat_2
//
//  Created by Halil Yavuz on 11.08.2024.
//

import SwiftUI
import UISystem

struct CodeVerificationView: View {
    @EnvironmentObject var router: Router
    @StateObject private var viewModel = OnboardingViewModel()
    @FocusState var focusedField: Int?

    let codeCountry: String
    let phoneNumber: String

    var body: some View {
        BackgroundView {
            VStack {
                OnboardingInfo(title: LocalizedStrings.Verification.enterCode, info: "\(LocalizedStrings.Verification.sentCodeToNumber) \n \(codeCountry) \(phoneNumber)")

                VStack(spacing: 30) {
                    codeInputView
                        .modifier(ShakeAnimation(animatableData: CGFloat(viewModel.attempts)))

                    if viewModel.showError {
                        Text(LocalizedStrings.Verification.incorrectCodeTryAgain)
                            .foregroundColor(Color.accent.danger)
                            .font(.metadata1)
                    }
                }
                .padding(.top, 20)

                Spacer()

                WBButton(text: LocalizedStrings.Verification.requestCodeAgain, isFilled: false)  {
                    viewModel.generateVerificationCode()
                }
                .padding(.bottom, 60)
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    WBBackButton(action: router.navigateBack)
                }
            }
        }
        .onTapGesture {
            viewModel.hideKeyboard()
        }
        .onAppear {
            viewModel.generateVerificationCode()
            viewModel.notificationManager.requestAuth()
        }
    }

    private var codeInputView: some View {
        HStack(spacing: 40) {
            ForEach(0..<viewModel.verificationCode.count, id: \.self) { index in
                codeTextField(for: index)
                    .focused($focusedField, equals: index)
                    .onChange(of: viewModel.verificationCode[index]) {
                        if let newFocusedIndex = viewModel.handleTextFieldChange(for: index, newValue: viewModel.verificationCode[index]) {
                            focusedField = newFocusedIndex
                        }
                        if viewModel.isCodeCorrect {
                            router.navigateTo(.registration)
                        }
                    }
            }
        }
    }

    private func codeTextField(for index: Int) -> some View {
        TextField("", text: $viewModel.verificationCode[index])
            .accentColor(.clear)
            .frame(width: 24, height: 24)
            .background(
                viewModel.verificationCode[index].isEmpty ?
                    Circle().fill(Color.CustomColors.circle) :
                    Circle().fill(Color.clear)
            )
            .keyboardType(.numberPad)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    focusedField = index
                }
            }
    }
}

#Preview {
    CodeVerificationView(codeCountry: "+7", phoneNumber: "999-99-99")
        .environmentObject(Router.init())
}
