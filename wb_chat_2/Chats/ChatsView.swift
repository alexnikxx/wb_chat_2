//
//  ChatsView.swift
//  wb_chat_2
//
//  Created by Tatiana Lazarenko on 8/14/24.
//

import SwiftUI
import OpenAIAPI
import UISystem

struct ChatsView: View {
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
                    .listRowBackground(Color("background"))
                    .listRowSeparatorTint(Color("textfield"))
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
        .background(Color("background"))
        .onTapGesture {
            hideKeyboard()
        }
    }
}

#Preview {
    ChatsView()
}
