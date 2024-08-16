//
//  ProfileEditViewModel.swift
//  wb_chat_2
//
//  Created by Halil Yavuz on 15.08.2024.
//

import SwiftUI
import SwiftData
import PhotosUI

enum ErrorField {
    case name
    case phoneNumber
}

final class ProfileEditViewModel: ObservableObject {
    @Published var selectedCountry: Country
    @Published var nameError: Bool = false
    @Published var phoneNumberError: Bool = false
    @Published var name: String = ""
    @Published var surname: String = ""
    @Published var phoneNumber: String = ""
    @Published var twitter: String = ""
    @Published var instagram: String = ""
    @Published var linkedin: String = ""
    @Published var facebook: String = ""
    @Published var selectedImage: UIImage?
    @Published var isImagePickerPresented = false
    @Published var errorTimer: Timer? = nil
    @Published var selectedItem: PhotosPickerItem? = nil
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext: ModelContext
    
    init(selectedCountry: Country = Country(name: "Russia", flag: "🇷🇺", code: "+7", digits: 10)) {
        self.selectedCountry = selectedCountry
    }
    
   private func checkValidation() -> Bool {
        var isValid = true
        
        if name.isEmpty {
            nameError = true
            isValid = false
            startErrorTimer(for: .name)
        }
        
        if phoneNumber.isEmpty || !isPhoneNumberValid() {
            phoneNumberError = true
            isValid = false
            startErrorTimer(for: .phoneNumber)
        }
        
        return isValid
    }
    
    func saveContact(modelContext: ModelContext, dismiss: () -> Void) {
        guard checkValidation() else {
            return
        }
        
        let socialMediaLinks = createSocialMediaLinks()
        let newContact = Contact(
            name: name,
            surname: surname.isEmpty ? nil : surname,
            avatar: selectedImage?.convertToBase64String(),
            phoneNumber: selectedCountry.code + phoneNumber,
            socialMediaLinks: socialMediaLinks
        )
        
        modelContext.insert(newContact)
        
        do {
            try modelContext.save()  // Сохраняем изменения в базе данных
        } catch {
            print("Ошибка сохранения: \(error)")
        }
        
        dismiss()
    }
    
    private func startErrorTimer(for field: ErrorField) {
        errorTimer = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { _ in
            withAnimation {
                switch field {
                case .name:
                    self.nameError = false
                case .phoneNumber:
                    self.phoneNumberError = false
                }
            }
        }
    }
    
    func isPhoneNumberValid() -> Bool {
        phoneNumber.filter({ $0.isNumber }).count == selectedCountry.digits
    }
    
    private func createSocialMediaLinks() -> [SocialMedia] {
        var links: [SocialMedia] = []
        
        if !twitter.isEmpty {
            links.append(SocialMedia(name: "twitter", nickname: twitter))
        }
        if !instagram.isEmpty {
            links.append(SocialMedia(name: "instagram", nickname: instagram))
        }
        if !linkedin.isEmpty {
            links.append(SocialMedia(name: "linkedin", nickname: linkedin))
        }
        if !facebook.isEmpty {
            links.append(SocialMedia(name: "facebook", nickname: facebook))
        }
        
        return links
    }
}
