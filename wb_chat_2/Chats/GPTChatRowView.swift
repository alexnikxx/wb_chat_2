//
//  GPTChatRowView.swift
//  wb_chat_2
//
//  Created by Tatiana Lazarenko on 8/18/24.
//

import SwiftUI

struct GPTChatRowView: View {
    @ObservedObject var viewModel = GPTViewModel()
    
    var body: some View {
        HStack {
            Image("ChatGPT_logo")
            .resizable()
            .frame(width: 48, height: 48)
            
            VStack {
                
            }
        }
    }
}

#Preview {
    GPTChatRowView()
}
