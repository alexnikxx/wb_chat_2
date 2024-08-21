//
//  ContactsViewModel.swift
//  wb_chat_2
//
//  Created by Tatiana Lazarenko on 8/10/24.
//

import SwiftUI
import SwiftData

final class ContactsViewModel: ObservableObject {
    @Published var navigateToAccountEdit = false
    @Published var showDeleteActionSheet = false
    @Published var showDeleteAlert = false
    @Published var contacts: [Contact] = []
    @Published var contactToDelete: Contact?
    @Published var inputText = ""
    
    
    func deleteContact(_ contact: Contact, modelContext: ModelContext) {
        modelContext.delete(contact)
    }
    
    func createMockContacts(modelContext: ModelContext) {
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
