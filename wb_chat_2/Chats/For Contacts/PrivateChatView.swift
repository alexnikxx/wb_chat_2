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
    @StateObject var viewModel: ChatViewModel
    @Environment(\.modelContext) private var modelContext: ModelContext
    @EnvironmentObject var router: Router
    private let chatId: UUID
    let contact: Contact

    init(chatId: UUID, contact: Contact) {

        _viewModel = StateObject(wrappedValue: ChatViewModel(chatId: chatId))
        self.chatId = chatId
        self.contact = contact
    }

    var body: some View {

        ZStack {
            ChatView(messages: viewModel.messages.map { $0.toChatMessage() }, chatType: .conversation) { draft in
                viewModel.sendMessage(draftMessage: draft,modelContext: modelContext)
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
                .onAppear {
                    viewModel.loadMockMessages(modelContext: modelContext)
                }
            }
            .chatTheme(colors: ChatTheme.Colors(
                mainBackground: .textfield,
                myMessage: .accent,
                friendMessage: .background,
                textLightContext: .heading2
            ))

            WBNavigationBar(
                title: contact.name,
                isBackButton: true,
                rightButtonIcon: "hamburger") { router.navigateBack() }
                .frame(maxHeight: .infinity, alignment: .top)
        }
    }
}
