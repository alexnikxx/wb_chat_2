//
//  ChatView.swift
//  wb_chat_2
//
//  Created by Aleksandra Nikiforova on 17/08/24.
//

import SwiftUI
import ExyteChat
import UISystem
import SwiftData

struct PrivateChatView: View {
    @Environment(\.colorScheme) var colorScheme
    @StateObject var viewModel: GPTViewModel
    @Environment(\.modelContext) private var modelContext: ModelContext

    let contact: Contact

    init(viewModel: GPTViewModel = GPTViewModel(), contact: Contact) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.contact = contact
    }

    var body: some View {
        ZStack {
            ChatView(messages: viewModel.messages) { draft in
                viewModel.sendMessage(draftMessage: draft, modelContext: modelContext)
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
                            Button {

                            } label: {
                                Image("plus")
                            }

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

            //            WBNavigationBar(
            //                title: "contact.name",
            //                isBackButton: true,
            //                rightButtonIcon: "hamburger") { }
            //                .frame(maxHeight: .infinity, alignment: .top)
        }
    }
}
