//
//  OnboardingView.swift
//  wb_chat_2
//
//  Created by Aleksandra Nikiforova on 10/08/24.
//

import SwiftUI

struct OnboardingView: View {
    @State private var isShowingTerms = false

    var body: some View {
        NavigationStack {
            VStack {
                VStack(spacing: 42) {
                    Image("Illustration")
                        .resizable()
                        .scaledToFit()
                        .frame(width: UIScreen.main.bounds.width - 112)

                    Text("""
                         Общайтесь с друзьями
                         и близкими легко
                         """)
                    .font(.appTitle)
                    .foregroundStyle(.text)
                    .multilineTextAlignment(.center)
                }
                .frame(maxHeight: .infinity, alignment: .center)

                VStack(spacing: 18) {
                    Button {
                        isShowingTerms = true
                    } label: {
                        Text("Пользовательское соглашение")
                            .font(.appSmallText)
                            .foregroundStyle(.text)
                    }

                    NavigationLink {
                        LoginView()
                    } label: {
                        Text("Начать общаться")
                            .modifier(ButtonModifier())
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding()
            .modifier(BackgroundModifier())
        }
        .sheet(isPresented: $isShowingTerms) {
            TermsView()
        }
    }
}

#Preview {
    OnboardingView()
}
