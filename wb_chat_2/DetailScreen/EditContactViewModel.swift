//
//  EditContactViewModel.swift
//  wb_chat_2
//
//  Created by Halil Yavuz on 18.08.2024.
//
import SwiftUI
import SwiftData

final class EditContactViewModel: ObservableObject {
    @Published var contact: Contact
    @Published var selectedImage: UIImage?

    @Environment(\.modelContext) private var modelContext: ModelContext
    
    init(contact: Contact) {
        self.contact = contact
        if let base64String = contact.avatar, let data = Data(base64Encoded: base64String), let image = UIImage(data: data) {
            self.selectedImage = image
        }
    }
    
     func updateSocialMedia(name: String, nickname: String) {
            if let index = contact.socialMediaLinks.firstIndex(where: { $0.name == name }) {
                if nickname.isEmpty {
                    contact.socialMediaLinks.remove(at: index)
                } else {
                    contact.socialMediaLinks[index].nickname = nickname
                }
            } else if !nickname.isEmpty {
                contact.socialMediaLinks.append(SocialMedia(name: name, nickname: nickname))
            }
        }
    
    
    func saveUser(modelContext: ModelContext) { 
        if !contact.name.isEmpty {
            contact.avatar = selectedImage?.convertToBase64String()
            
            modelContext.insert(contact)
            do {
                try modelContext.save()
            } catch {
                print("Ошибка сохранения: \(error)")
            }
        }
    }
}
