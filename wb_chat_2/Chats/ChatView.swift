//
//  ChatsView.swift
//  wb_chat_2
//
//  Created by Aleksandra Nikiforova on 19/08/24.
//

import SwiftUI
import UISystem

struct ChatsView: View {
    @EnvironmentObject private var viewModelGPT: GPTViewModel
    @State var inputText = ""
    @State var isChatGPT: Bool = false

    var filteredContacts = Contacts.contacts.filter { $0.hasMessages }

    var body: some View {
        BackgroundView {
            VStack {
                WBNavigationBar(
                    title: "Чаты",
                    isBackButton: false,
                    rightButtonIcon: "message_plus_alt",
                    rightButtonAction: { 
                        if isChatGPT {
                            withAnimation {
                                viewModelGPT.addNewChat()
                            }
                        }
                    },
                    backButtonAction: { }, isSubtitle: false
                )
                StoriesView()

                VStack(spacing: 0) {
                    HStack(spacing: 20) {
                        VStack {
                            Button("Все чаты") {
                                isChatGPT = false
                            }
                            Indicator()
                                .opacity(isChatGPT ? 0 : 1)
                        }
                        .fixedSize(horizontal: true, vertical: true)

                        VStack {
                            Button("Чат GPT") {
                                isChatGPT = true
                            }
                            Indicator()
                                .opacity(isChatGPT ? 1 : 0)
                        }
                        .fixedSize(horizontal: true, vertical: true)
                    }
                    .font(.bodyText1(.semiBold))
                    .foregroundStyle(.heading2)

                    Divider()
                }
                if !isChatGPT {
                    ChatListView(
                        filteredContacts: filteredContacts,
                        inputText: $inputText
                    )
                } else {
                    ChatsGPTView()
                }
            }
            .ignoresSafeArea()
            .frame(maxHeight: .infinity, alignment: .top)
        }
    }
}

#Preview {
    ChatsView()
        .environmentObject(GPTViewModel())
}
