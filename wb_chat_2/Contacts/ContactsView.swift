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
                                deleteContact(contact)
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
                        avatar: convertImageToBase64String(imageName: "Анастасия Иванова"),
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
                        avatar: convertImageToBase64String(imageName: "Петя"),
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
    
    func convertImageToBase64String(imageName: String) -> String? {
        if let image = UIImage(named: imageName),
           let imageData = image.pngData() {
            return imageData.base64EncodedString()
        }
        return nil
    }
}
