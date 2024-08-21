//
//  ChatsView.swift
//  wb_chat_2
//
//  Created by Aleksandra Nikiforova on 19/08/24.
//

import SwiftUI
import UISystem
import SwiftData

struct ChatsView: View {
    @EnvironmentObject var router: Router
    @EnvironmentObject private var viewModelGPT: GPTViewModel
    @State var inputText = ""
    @State var isChatGPT: Bool = false
    @Environment(\.modelContext) private var modelContext: ModelContext
    @Query var contacts: [Contact]
    @State private var isShowingContacts = false
    @State private var selectedContact: Contact?
    
    var filteredContacts: [Contact] { contacts.filter { $0.hasMessages } }

    var body: some View {
        BackgroundView {
            VStack {
                WBNavigationBar(
                    title: "Чаты",
                    isBackButton: false,
                    rightButtonIcon: "message_plus_alt",
                    rightButtonAction: { 
                        if isChatGPT {
                            withAnimation {
                                viewModelGPT.addNewChat(modelContext: modelContext)
                            }
                        } else {
                            isShowingContacts = true
                        }
                    },
                    backButtonAction: { }, isSubtitle: false
                )

                StoriesView()

                VStack(spacing: 0) {
                    HStack(spacing: 20) {
                        VStack {
                            Button("Все чаты") {
                                isChatGPT = false
                            }
                            Indicator()
                                .opacity(isChatGPT ? 0 : 1)
                        }
                        .fixedSize(horizontal: true, vertical: true)

                        VStack {
                            Button("Чат GPT") {
                                isChatGPT = true
                            }
                            Indicator()
                                .opacity(isChatGPT ? 1 : 0)
                        }
                        .fixedSize(horizontal: true, vertical: true)
                    }
                    .font(.bodyText1(.semiBold))
                    .foregroundStyle(Color.CustomColors.heading2)

                    Divider()
                }
                if !isChatGPT {
                    ChatListView(
                        filteredContacts: filteredContacts,
                        inputText: $inputText
                    )
                } else {
                    ChatsGPTView()
                }
            }
            .sheet(isPresented: $isShowingContacts) {
                ContactsListView { contact in
                    let chatId = UUID()
                    selectedContact = contact
                    router.navigateTo(.chatWithContact(chatId: chatId, contact: contact))  // Переход к экрану чата с выбранным контактом
                }
            }
//            .ignoresSafeArea()
            .frame(maxHeight: .infinity, alignment: .top)
            
        }
    }
}

#Preview {
    ChatsView()
        .environmentObject(GPTViewModel())
}

struct ContactsListView: View {
    @Environment(\.dismiss) var dismiss
    @Query var contacts: [Contact]
    var onSelect: (Contact) -> Void
    
    var body: some View {
        NavigationView {
            List(contacts, id: \.id) { contact in
                Button(action: {
                    onSelect(contact)
                    dismiss()
                }) {
                    Text(contact.fullname)
                }
            }
            .navigationBarTitle("Выберите контакт", displayMode: .inline)
        }
    }
}
