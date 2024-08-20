//
//  ChatsView.swift
//  wb_chat_2
//
//  Created by Tatiana Lazarenko on 8/14/24.
//

import SwiftUI
import OpenAIAPI
import UISystem

struct ChatsGPTView: View {
    @EnvironmentObject var router: Router
    @State private var inputText = ""
    @ObservedObject var viewModel = GPTViewModel()
    
    private let chats: [Int] = [1]

    var body: some View {
        VStack {
            WBNavigationBar(title: LocalizedStrings.chats, isBackButton: false, rightButtonIcon: "plus") {
                //router.navigateTo(CreateChat)
            }
            
            WBSearchBarView(inputText: $inputText)
                .padding(.horizontal, 24)
                .padding(.top, 16)
            
            List(chats, id: \.self) { chat in
                GPTChatRowView()
                    .listRowBackground(Color.CustomColors.background)
                    .listRowSeparatorTint(Color.CustomColors.textfield)
                    .alignmentGuide(.listRowSeparatorLeading) { _ in 0 }
                    .alignmentGuide(.listRowSeparatorTrailing) { separator in
                        separator.width - 2
                    }
                    .padding(5)
                    .onTapGesture {
                        router.navigateTo(.gptChat)
                    }
            }
            .listStyle(.plain)
            
        }
        .edgesIgnoringSafeArea(.top)
        .background(Color.CustomColors.background)
        .onTapGesture {
            hideKeyboard()
        }
    }
}

#Preview {
    ChatsGPTView()
}
