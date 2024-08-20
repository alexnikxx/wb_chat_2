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
    @Environment(\.colorScheme) var colorScheme
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
            } inputViewBuilder: { textBinding, attachments, inputViewState, inputViewStyle, inputViewActionClosure, dismissKeyboardClosure in
                Group {
                    ZStack {
                        Rectangle()
                            .foregroundStyle(Color("background"))
                            .frame(height: 60)
                            .shadow(
                                color: Color("heading2").opacity(colorScheme == .light ? 0.04 : 0),
                                radius: 12,
                                x: 0,
                                y: -1
                            )
                        
                        Rectangle()
                            .foregroundStyle(Color("background"))
                            .frame(height: 60)
                            .offset(x: 0, y: 40)
                        
                        HStack(spacing: 12) {
                            WBTextField(placeholder: "Аа", text: textBinding)
                            
                            Button {
                                inputViewActionClosure(.send)
                            } label: {
                                Image("send-alt-filled")
                            
                                
                            }
                            .disabled(textBinding.wrappedValue.isEmpty)
                        }
                        .padding(.horizontal)
                    }
                }
            }
            .chatTheme(colors: ChatTheme.Colors(
                mainBackground: .textfield,
                myMessage: .accent,
                friendMessage: .background
            ))
        }
        .onAppear {
            viewModelGPT.switchToChat(chat)
        }
        .edgesIgnoringSafeArea(.top)
        
    }
}

