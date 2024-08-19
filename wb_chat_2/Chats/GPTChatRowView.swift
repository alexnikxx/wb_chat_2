//
//  GPTChatRowView.swift
//  wb_chat_2
//
//  Created by Tatiana Lazarenko on 8/18/24.
//

import SwiftUI
import UISystem

struct GPTChatRowView: View {
    @ObservedObject var viewModel = GPTViewModel()
    
    let chat: Chat
    
    var body: some View {
        HStack(spacing: 12) {
            Image("ChatGPT_logo")
            .resizable()
            .frame(width: 48, height: 48)
            
            VStack(alignment: .leading, spacing: 2) {
                Text(viewModel.model.rawValue)
                    .font(.bodyText1(.semiBold))
                    .foregroundStyle(Color("heading2"))
                    .frame(height: 24)
                
                Text(chat.messages.last?.text ?? "last message")
                    .font(.metadat1(.regular))
                    .foregroundStyle(Color("metadata2"))
                    .frame(height: 20)
                
                Spacer()
            }
            Spacer()
        }
        .frame(height: 56)
    }
}
//
//#Preview {
//    GPTChatRowView()
//}
