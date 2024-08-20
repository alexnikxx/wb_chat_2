//
//  OnboardingView.swift
//  wb_chat_2
//
//  Created by Aleksandra Nikiforova on 10/08/24.
//

import SwiftUI
import UISystem

struct OnboardingView: View {
    @EnvironmentObject var router: Router
    @Environment(\.dismiss) var dismiss
    @State private var isShowingTerms = false

    var body: some View {
        BackgroundView {
            VStack {
                VStack(spacing: 42) {
                    Image("Illustration")
                        .resizable()
                        .scaledToFit()
                        .padding(.horizontal, 56)

                    Text(LocalizedStrings.Onboarding.communicateWithFriends)
                    .font(.heading2(.bold))
                    .foregroundStyle(Color.CustomColors.heading2)
                    .multilineTextAlignment(.center)
                }
                .frame(maxHeight: .infinity, alignment: .top)
                .padding(.top, 85)

                VStack(spacing: 16) {
                    VStack(spacing: 4) {
                        Text(LocalizedStrings.Onboarding.pressingContinueButton)
                        HStack(spacing: 4) {
                            Button(LocalizedStrings.Onboarding.privacyPolicy) { isShowingTerms = true }
                                .foregroundStyle(.accent)
                            Text(LocalizedStrings.Onboarding.and)
                            Button(LocalizedStrings.Onboarding.termsOfUse) { isShowingTerms = true }
                                .foregroundStyle(.accent)
                        }
                    }
                    .font(.metadat1(.regular))
                    .foregroundStyle(Color.CustomColors.metadata2)

                    WBButton(text: LocalizedStrings.Onboarding.startChatting) {
                        router.navigateTo(.authorization)
                    }
                }
            }
            .padding()
        }
        .sheet(isPresented: $isShowingTerms) {
            VStack {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .foregroundStyle(.gray)
                }
                .padding()

                Text(LocalizedStrings.Onboarding.privacyPolicy)
                    .frame(maxHeight: .infinity, alignment: .center)
            }
        }
    }
}

#Preview {
    OnboardingView()
}
