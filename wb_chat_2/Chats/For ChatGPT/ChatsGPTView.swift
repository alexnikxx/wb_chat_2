//
//  ChatsView.swift
//  wb_chat_2
//
//  Created by Tatiana Lazarenko on 8/14/24.
//

import SwiftUI
import OpenAIAPI
import UISystem
import SwiftData

struct ChatsGPTView: View {
    @EnvironmentObject var router: Router
    @EnvironmentObject private var viewModelGPT: GPTViewModel
    @State private var inputText = ""
    @Environment(\.modelContext) private var modelContext: ModelContext

    var body: some View {
        VStack {
            List {
                ForEach(viewModelGPT.chats, id: \.self) { chat in
                    GPTChatRowView(chat: chat)
                        .listRowBackground(Color.CustomColors.background)
                        .listRowSeparator(.hidden)
                        .onTapGesture {
                            router.navigateTo(.gptChat(chat: chat))
                        }
                }
                .onDelete { indexSet in
                    withAnimation {
                        viewModelGPT.deleteChat(at: indexSet, modelContext: modelContext)
                    }
                }
            }
            .listStyle(.plain)
            .onAppear {
                viewModelGPT.loadChats(modelContext: modelContext)
            }
        }
    }
}
