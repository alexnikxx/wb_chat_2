//
//  GPTChatView.swift
//  wb_chat_2
//
//  Created by Tatiana Lazarenko on 8/18/24.
//

import SwiftUI
import OpenAIAPI
import UISystem
import ExyteChat

struct GPTChatView: View {
    @EnvironmentObject var router: Router
    @EnvironmentObject private var viewModelGPT: GPTViewModel
    
    var chat: Chat

    var body: some View {
        VStack {
            WBNavigationBar(title: chat.title, isBackButton: true, rightButtonIcon: "reload", rightButtonAction: {
                viewModelGPT.clearHistory()
            }, backButtonAction: router.navigateBack)
            
            ChatView(messages: viewModelGPT.messages, chatType: .conversation) { draft in
                viewModelGPT.sendMessage(draftMessage: draft)
            }
            .messageUseMarkdown(messageUseMarkdown: true)
            .padding(.vertical, 20)
        }
        .onAppear {
            viewModelGPT.switchToChat(chat)
        }
        .edgesIgnoringSafeArea(.top)
        
    }
}

