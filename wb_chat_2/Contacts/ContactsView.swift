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
    @EnvironmentObject var router: Router
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
        VStack {
            WBNavigationBar(
                title: LocalizedStrings.contacts,
                isBackButton: false,
                rightButtonIcon: "plus",
                rightButtonAction: { router.navigateTo(.newContact) },
                backButtonAction: { }, isSubtitle: false
            )
            
            WBSearchBarView(inputText: $inputText)
                .padding(.horizontal, 24)
                .padding(.top, 16)
            
            List(filteredContacts, id: \.self) { contact in
                ContactRowView(contact: contact)
                    .listRowBackground(Color("background"))
                    .listRowSeparatorTint(Color("textfield"))
                    .alignmentGuide(.listRowSeparatorLeading) { _ in 0 }
                    .alignmentGuide(.listRowSeparatorTrailing) { separator in
                        separator.width - 2
                    }
                    .padding(5)
                    .onTapGesture {
                        router.navigateTo(.contactDetails(contact: contact))
                    }
                    .contextMenu {
                        Button("Удалить", role: .destructive) {
                            contactToDelete = contact
                            showDeleteAlert = true
                        }
                    }
                    .alert("Удалить контакт?", isPresented: $showDeleteAlert, presenting: contactToDelete) { contact in
                        Button("Удалить", role: .destructive) {
                            deleteContact(contact)
                        }
                        Button("Отмена", role: .cancel) { }
                    } message: { contact in
                        Text("Вы действительно хотите удалить контакт \(contact.fullname)?")
                    }
                
                    
            }
            .listStyle(.plain)
            .edgesIgnoringSafeArea(.top)
            .background(Color("background"))
        }
        .onAppear {
            createMockContacts()
        }
        
    }
    private func deleteContact(_ contact: Contact) {
        modelContext.delete(contact)
    }
    
    func createMockContacts() {
        do {
            let existingContacts = try modelContext.fetch(FetchDescriptor<Contact>())
            if existingContacts.isEmpty {
                let contacts = [
                    Contact(
                        name: "Анастасия",
                        surname: "Иванова",
                        avatar: "Анастасия Иванова",
                        phoneNumber: "+7 999 999-99-99",
                        hasMessages: true,
                        socialMediaLinks: [
                            SocialMedia(name: "facebook", nickname: "1"),
                            SocialMedia(name: "instagram", nickname: "2"),
                            SocialMedia(name: "twitter", nickname: "3")
                        ]
                    ),
                    Contact(
                        name: "Петя",
                        surname: nil,
                        avatar: "Петя",
                        phoneNumber: "+7 999 999-99-99",
                        hasMessages: true,
                        socialMediaLinks: [
                            SocialMedia(name: "facebook", nickname: "4"),
                            SocialMedia(name: "instagram", nickname: "5"),
                            SocialMedia(name: "twitter", nickname: "6"),
                            SocialMedia(name: "linkedin", nickname: "7")
                        ]
                    ),
                    Contact(
                        name: "Иван",
                        surname: "Иванов",
                        avatar: nil,
                        phoneNumber: "+7 999 999-99-99",
                        hasMessages: true,
                        socialMediaLinks: [
                            SocialMedia(name: "facebook", nickname: "13"),
                            SocialMedia(name: "linkedin", nickname: "14")
                        ]
                    )
                ]
                
                contacts.forEach { modelContext.insert($0) }
                try modelContext.save()
            }
        } catch {
            print("Error fetching or saving contacts: \(error.localizedDescription)")
        }
    }
}

    


#Preview {
    ContactsView()
}
