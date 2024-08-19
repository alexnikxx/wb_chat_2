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
    @EnvironmentObject private var viewModelGPT: GPTViewModel
    @State private var inputText = ""
    
    var body: some View {
        VStack {
            List(viewModelGPT.chats, id: \.self) { chat in
                GPTChatRowView(chat: chat)
                    .listRowBackground(Color("background"))
                    .listRowSeparatorTint(Color("textfield"))
                    .alignmentGuide(.listRowSeparatorLeading) { _ in 0 }
                    .alignmentGuide(.listRowSeparatorTrailing) { separator in
                        separator.width - 2
                    }
                    .padding(5)
                    .onTapGesture {
                        router.navigateTo(.gptChat(chat: chat))
                    }
            }
            .listStyle(.plain)
            
        }
        .background(Color("background"))
    }
}

#Preview {
    ChatsGPTView()
}
