//
//  ContactsView.swift
//  wb_chat_2
//
//  Created by Tatiana Lazarenko on 8/10/24.
//

import SwiftUI
import UISystem

import SwiftUI
import UISystem
import SwiftData

struct ContactsView: View {
    //@EnvironmentObject var router: Router
    @State private var inputText = ""
    @Query var contacts: [Contact]
    @State private var navigateToAccountEdit = false
    @State private var showDeleteActionSheet = false
    @State private var showDeleteAlert = false
    @State private var contactToDelete: Contact?
    @Environment(\.modelContext) private var modelContext
    
    private var filteredContacts: [Contact] {
        inputText.isEmpty ? contacts : contacts.filter { $0.fullname.lowercased().contains(inputText.lowercased())
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                WBNavigationBar(
                    title: LocalizedStrings.contacts,
                    isBackButton: false,
                    rightButtonIcon: "plus",
                    rightButtonAction: {
                        navigateToAccountEdit = true
                    }
                )
                .navigationDestination(isPresented: $navigateToAccountEdit) {
                    ProfileEditView()
                }
                WBSearchBarView(inputText: $inputText)
                    .padding(.horizontal, 24)
                    .padding(.top, 16)
                
                List(filteredContacts) { contact in
                    ContactRowView(contact: contact)
                        .listRowBackground(Color("background"))
                      //  .listRowSeparatorTint(Color("textfield"))
                        .alignmentGuide(.listRowSeparatorLeading) { _ in 0 }
                        .alignmentGuide(.listRowSeparatorTrailing) { separator in
                            separator.width - 2
                        }
                        .padding(5)
                        .contextMenu {
                            Button("Удалить", role: .destructive) {
                                contactToDelete = contact
                                showDeleteAlert = true
                            }
                        }
//                        .background(
//                            NavigationLink(destination: ContactDetailView(name: contact.name, surname: contact.surname, phoneNumber: contact.phoneNumber, avatar: contact.avatar, socialMediaLinks: contact.socialMediaLinks)) {
//                                
//                            }
//                                .opacity(0)
//                        )
                }
                
                .listStyle(.plain)
                .alert("Удалить контакт?", isPresented: $showDeleteAlert, presenting: contactToDelete) { contact in
                    Button("Удалить", role: .destructive) {
                        deleteContact(contact)
                    }
                    Button("Отмена", role: .cancel) { }
                } message: { contact in
                    Text("Вы действительно хотите удалить контакт \(contact.fullname)?")
                }
                
                
            }
            .edgesIgnoringSafeArea(.top)
            .background(Color("background"))
            
        }
        
    }
    private func deleteContact(_ contact: Contact) {
        modelContext.delete(contact)
    }
    
    
}

#Preview {
    ContactsView()
}
