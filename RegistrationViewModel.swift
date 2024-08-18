//
//  RegistrationViewModel.swift
//  wb_chat_2
//
//  Created by Halil Yavuz on 18.08.2024.
//

import SwiftUI
import SwiftData
import PhotosUI

final class RegistrationViewModel: ObservableObject {
    @Published var selectedCountry: Country
    @Published var name: String = ""
    @Published var surname: String = ""
    @Published var codeCountry: String = ""
    @Published var phoneNumber: String = ""
    @Published var selectedImage: UIImage?
    @Published var isImagePickerPresented = false
    @Published var nameError: Bool = false
    @Published var errorTimer: Timer? = nil
    @Published var selectedItem: PhotosPickerItem? = nil
    
    init(selectedCountry: Country = Country(name: "Russia", flag: "🇷🇺", code: "+7", digits: 10)) {
        self.selectedCountry = selectedCountry
    }
    
     func checkValidation() -> Bool {
            var isValid = true
            
            if name.isEmpty {
                nameError = true
                isValid = false
                startErrorTimer(for: .name)
            }
            
            return isValid
        }
        
        func saveUser(modelContext: ModelContext) {
            guard checkValidation() else {
                return
            }
            
            let newUser = User(
                name: name,
                surname: surname.isEmpty ? nil : surname,
                phoneNumber: selectedCountry.code + phoneNumber,
                avatar: selectedImage?.convertToBase64String()
            )
            
            modelContext.insert(newUser)
            
            do {
                try modelContext.save()
            } catch {
                print("Ошибка сохранения: \(error)")
            }
            
            
        }
        
        private func startErrorTimer(for field: ErrorField) {
            errorTimer = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { _ in
                withAnimation {
                    switch field {
                    case .name:
                        self.nameError = false
                    
                    }
                }
            }
        }
        

    enum ErrorField {
        case name
    }
}
