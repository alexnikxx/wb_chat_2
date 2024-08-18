//
//  GPTChatView.swift
//  wb_chat_2
//
//  Created by Tatiana Lazarenko on 8/18/24.
//

import SwiftUI
import OpenAIAPI
import UISystem

struct GPTChatView: View {
    @ObservedObject var viewModel = GPTViewModel()

    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading) {
                    ForEach(viewModel.GPTmessages, id: \.self) { message in
                        Text("\(message.role?.capitalized ?? "🥝"): \(message.content ?? "🍎")")
                            .padding()
                            .background(message.role == "user" ? Color.blue.opacity(0.1) : Color.gray.opacity(0.1))
                            .cornerRadius(8)
                            .frame(maxWidth: .infinity, alignment: message.role == "user" ? .trailing : .leading)
                            .padding(.vertical, 2)
                    }
                }
            }
            .padding()

            HStack {
                TextField("Enter your message...", text: $viewModel.inputText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(minHeight: 30)

                Button(action: {
                    viewModel.sendMessage()
                }) {
                    Image(systemName: "paperplane.fill")
                        .padding()
                        .frame(height: 35)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                
                Button(action: {
                    viewModel.clearHistory()
                }) {
                    Image(systemName: "trash.fill")
                        .padding()
                        .frame(height: 35)
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
            .padding()
            .padding(.bottom, 80)
        }
        .padding(.top, 50)
    }
}


#Preview {
    GPTChatView()
}
