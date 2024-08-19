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
    @ObservedObject var viewModel = GPTViewModel()

    var body: some View {
        VStack {
            WBNavigationBar(title: viewModel.model.rawValue, isBackButton: true, rightButtonIcon: "reload", rightButtonAction: {
                viewModel.clearHistory()
            }, backButtonAction: router.navigateBack)
            
            ChatView(messages: viewModel.messages, chatType: .conversation) { draft in
                viewModel.sendMessage(draftMessage: draft)
            }
            .messageUseMarkdown(messageUseMarkdown: true)
            .padding(.vertical, 20)
        }
        .edgesIgnoringSafeArea(.top)
        
    }
}


#Preview {
    GPTChatView()
}
