//
//  CodeVerificationView.swift
//  wb_chat_2
//
//  Created by Halil Yavuz on 11.08.2024.
//

import SwiftUI

struct CodeVerificationView: View {
    @StateObject private var viewModel = CodeVerificationViewModel()
    
    let codeCountry: String
    let phoneNumber: String
    @FocusState var focusedField: Int?
    
    var body: some View {
        NavigationStack {
            VStack {
                headerView
                codeInputView
                errorView
                //                WBButton(text: LocalizedStrings.requestCodeAgain, action: {
                //                    viewModel.generateVerificationCode()
                //                }, backgroundColor: .clear, textColor: Color("backgroundPurple"))
            }
            .onAppear {
                viewModel.generateVerificationCode()
                viewModel.notificationManager.requestAuth()
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    //   BackButton()
                }
            }
            .padding(.top, 169)
            Spacer()
        }
        .navigationBarBackButtonHidden()
    }
    
    private var headerView: some View {
        VStack {
            Text(LocalizedStrings.enterCode)
                .font(.system(size: 24, weight: .bold))
                .padding(.bottom, 8)
            Text(LocalizedStrings.sentCodeToNumber)
                .font(.system(size: 14))
                .multilineTextAlignment(.center)
                .padding(.bottom, 8)
            HStack(spacing: 5) {
                Text(codeCountry)
                    .font(.system(size: 14))
                Text(phoneNumber)
                    .font(.system(size: 14))
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
                    }
            }
        }
        .padding(.horizontal, 24)
        .padding(.bottom, 25)
    }
    
    private var errorView: some View {
        Group {
            if viewModel.showError {
                Text(LocalizedStrings.incorrectCodeTryAgain)
                    .foregroundColor(.red)
                    .font(.system(size: 14))
                    .padding(.bottom, 15)
            }
        }
    }
    
    private func codeTextField(for index: Int) -> some View {
        TextField("", text: $viewModel.verificationCode[index])
            .frame(width: 24, height: 24)
            .background(viewModel.verificationCode[index].isEmpty ? Circle().fill(Color(UIColor.systemGray6)) : Circle().fill(Color.white))
            .multilineTextAlignment(.center)
            .keyboardType(.numberPad)
            .font(.system(size: 24, weight: .bold))
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    focusedField = index
                }
            }
    }
}

#Preview {
    CodeVerificationView(codeCountry: "+7", phoneNumber: "999-99-99")
}
