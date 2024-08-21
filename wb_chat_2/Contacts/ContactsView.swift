//
//  ContactsView.swift
//  wb_chat_2
//
//  Created by Tatiana Lazarenko on 8/10/24.
//

import SwiftUI
import UISystem
import SwiftData

struct ContactsView: View {
    @StateObject private var viewModel = ContactsViewModel()
    @EnvironmentObject var router: Router
    @Environment(\.modelContext) private var modelContext
    
    @Query var contacts: [Contact]
    
    private var filteredContacts: [Contact] {
        viewModel.inputText.isEmpty ? contacts : contacts.filter { $0.fullname.lowercased().contains(viewModel.inputText.lowercased())
        }
    }
    
    var body: some View {
        BackgroundView {
            VStack {
                WBNavigationBar(
                    title: LocalizedStrings.contacts,
                    isBackButton: false,
                    rightButtonIcon: "plus",
                    rightButtonAction: { router.navigateTo(.newContact) },
                    backButtonAction: { }
                )
                
                WBSearchBarView(inputText: $viewModel.inputText)
                    .padding(.horizontal, 24)
                    .padding(.top, 16)
                
                List(filteredContacts, id: \.self) { contact in
                    ContactRowView(contact: contact)
                        .listRowInsets(EdgeInsets(top: 7, leading: 0, bottom: 7, trailing: 0))
                        .listRowSeparator(.hidden)
                        .contextMenu {
                            Button("Удалить", role: .destructive) {
                                viewModel.contactToDelete = contact
                                viewModel.showDeleteAlert = true
                            }
                        }
                        .alert("Удалить контакт?", isPresented: $viewModel.showDeleteAlert, presenting: viewModel.contactToDelete) { contact in
                            Button("Удалить", role: .destructive) {
                                viewModel.deleteContact(contact, modelContext: modelContext)
                            }
                            Button("Отмена", role: .cancel) { }
                        } message: { contact in
                            Text("Вы действительно хотите удалить контакт \(contact.fullname)?")
                        }
                        .onTapGesture {
                            router.navigateTo(.contactDetails(contact: contact))
                        }
                }
                .padding(.horizontal, 24)
                .listStyle(.plain)
            }
        }
        .onAppear {
            viewModel.createMockContacts(modelContext: modelContext)
        }
    }
    
}
