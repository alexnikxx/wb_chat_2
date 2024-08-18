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
    @StateObject private var viewModel = CodeVerificationViewModel()
    
    let codeCountry: String
    let phoneNumber: String
    @FocusState var focusedField: Int?
    
    var body: some View {
            VStack {
                headerView
                codeInputView
                errorView
                
                WBButton(text: LocalizedStrings.requestCodeAgain, isFilled: false)  {
                    viewModel.generateVerificationCode()
                }
            }
            .onTapGesture {
                hideKeyboard()
            }
            .onAppear {
                viewModel.generateVerificationCode()
                viewModel.notificationManager.requestAuth()
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    WBBackButton(action: router.navigateBack)
                }
            }
            .padding(.top, 169)

            Spacer()
    }

    private var headerView: some View {
        VStack {
            Text(LocalizedStrings.enterCode)
                .font(.heading2(.bold, size: 24))
                .padding(.bottom, 8)
            Text(LocalizedStrings.sentCodeToNumber)
                .font(.bodyText1(.regular, size: 14))
                .multilineTextAlignment(.center)
                .padding(.bottom, 8)
            HStack(spacing: 5) {
                Text(codeCountry)
                    .font(.bodyText1(.regular, size: 14))
                Text(phoneNumber)
                    .font(.bodyText1(.regular, size: 14))
                    
            }
            .padding(.bottom, 49)
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
        .padding(.horizontal, 24)
        .padding(.bottom, 30)
    }
    
    private var errorView: some View {
        Group {
            if viewModel.showError {
                Text(LocalizedStrings.incorrectCodeTryAgain)
                    .foregroundColor(.red)
                    .font(.bodyText1(.regular, size: 13))
            }
        }
    }
    
    private func codeTextField(for index: Int) -> some View {
        TextField("", text: $viewModel.verificationCode[index])
            .frame(width: 24, height: 24)
            .background(viewModel.verificationCode[index].isEmpty ? Circle().fill(Color("textfield")) : Circle().fill(Color.white))
            .multilineTextAlignment(.center)
            .keyboardType(.numberPad)
            .font(.subheading1(.bold, size: 24))
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
