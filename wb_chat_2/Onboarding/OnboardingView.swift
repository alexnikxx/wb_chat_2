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
    @State private var isShowingTerms = false

    var body: some View {
            BackgroundView {
                VStack {
                    VStack(spacing: 42) {
                        Image("Illustration")
                            .resizable()
                            .scaledToFit()
                            .padding(.horizontal, 56)

                        Text("""
                         Общайтесь с друзьями
                         и близкими легко
                         """)
                        .font(.heading2(.bold))
                        .foregroundStyle(.heading2)
                        .multilineTextAlignment(.center)
                    }
                    .frame(maxHeight: .infinity, alignment: .center)
                    
                    VStack(spacing: 18) {
                        VStack(spacing: 10) {
                            VStack {
                                Text("Нажимая кнопку продолжить я соглашаюсь с")
                                HStack(spacing: 4) {
                                    Button("Политикой Конфиденциальности") { isShowingTerms = true }
                                        .foregroundStyle(.accent)
                                    Text(" и ")
                                    Button("Условиями Использования") { isShowingTerms = true }
                                        .foregroundStyle(.accent)
                                }
                            }
                            .font(.metadat1(.regular))
                            .foregroundStyle(.metadata2)

                            WBButton(text: "Начать общаться") {
                                router.navigateTo(.authorization)
                            }
                        }
                    }
                }
                .padding()
            
        }
        .sheet(isPresented: $isShowingTerms) {
            TermsView()
        }
    }
}

#Preview {
    OnboardingView()
}
