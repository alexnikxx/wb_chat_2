//
//  ProfileEditView.swift
//  wb_chat_2
//
//  Created by Halil Yavuz on 15.08.2024.
//

import SwiftUI
import PhotosUI
import SwiftData
import UISystem

struct ProfileEditView: View {
    @StateObject private var viewModel = ProfileEditViewModel()
    @Environment(\.modelContext) private var modelContext: ModelContext
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        
        WBNavigationBar(title: LocalizedStrings.newContactTittle, isBackButton: true, rightButtonIcon: "")
        
        VStack(spacing: 12) {
            avatarView
                .padding(.bottom, 31)
            
            textField(name: LocalizedStrings.nameTF, text: $viewModel.name)
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(viewModel.nameError ? Color.red.opacity(0.5) : Color.clear, lineWidth: 2)
                        .padding(.horizontal, 25)
                        .padding(.vertical, 2)
                        .animation(.easeInOut, value: viewModel.nameError))
                .overlay(
                    viewModel.nameError ? Text("Обязательное поле")
                        .font(.caption)
                        .foregroundColor(.red)
                        .padding(.top, 5)
                        .padding(.trailing, 40)
                        .frame(maxWidth: .infinity, alignment: .trailing) : nil
                )
            textField(name: LocalizedStrings.surnameTF, text: $viewModel.surname)
                .padding(.bottom, 16)
            Divider()
                .padding(.horizontal, 16)
            HStack {
                CountryView(selectedCountry: viewModel.selectedCountry)
                    .padding(.leading, 20)
                phoneNumberInput
                    .padding(.trailing, 22)
            }
            Divider()
                .padding(.horizontal, 16)
                .padding(.bottom, 16)
            textField(name: "twitter", text: $viewModel.twitter)
            textField(name: "@instagram", text: $viewModel.instagram)
            textField(name: "linkedin", text: $viewModel.linkedin)
            textField(name: "facebook/profile", text: $viewModel.facebook)
                .padding(.bottom, 25)
            WBButton(text: LocalizedStrings.saveButton) {
                viewModel.saveContact(modelContext: modelContext, dismiss: {
                    dismiss()
                })
            }
        }
        .padding(.top, 46)
        Spacer()
            .navigationBarBackButtonHidden()
        
    }
    
    private func textField(name: String, text: Binding<String>) -> some View {
        let back = RoundedRectangle(cornerRadius: 10)
            .fill(Color(UIColor.systemGray6))
        
        return TextField(name, text: text)
            .padding(.horizontal, 12)
            .padding(.vertical, 10)
            .cornerRadius(4)
            .background(back)
            .padding(.horizontal, 24)
    }
    
    private var phoneNumberInput: some View {
        let textField = TextField("000 000-00-00", text: $viewModel.phoneNumber)
            .foregroundColor(.gray)
            .fontWeight(.semibold)
            .keyboardType(.numberPad)
            .padding(.horizontal, 8)
            .padding(.vertical, 10)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color(UIColor.systemGray6))
            )
            .onChange(of: viewModel.phoneNumber) {
                viewModel.phoneNumber = viewModel.phoneNumber.formatDigits(mask: "XXX XXX-XX-XX")
            }
            .onChange(of: viewModel.isPhoneNumberValid()) {
                hideKeyboard()
            }
            .onTapGesture {
                hideKeyboard()
            }
        
        let errorOverlay = RoundedRectangle(cornerRadius: 5)
            .stroke(viewModel.phoneNumberError ? Color.red.opacity(0.5) : Color.clear, lineWidth: 2)
            .padding(.vertical, -1)
            .padding(.horizontal, -1)
            .animation(.easeInOut, value: viewModel.phoneNumberError)
        
        let errorTextOverlay = viewModel.phoneNumberError ? Text("Обязательное поле")
            .font(.caption)
            .foregroundColor(.red)
            .padding(.top, 5)
            .padding(.trailing, 5)
            .frame(maxWidth: .infinity, alignment: .trailing) : nil
        
        return textField
            .overlay(errorOverlay)
            .overlay(errorTextOverlay)
    }
    
    private var avatarView: some View {
        ZStack(alignment: .bottomTrailing) {
            if let image = viewModel.selectedImage {
                Image(uiImage: image)
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
            } else {
                Circle()
                    .fill(Color(UIColor.systemGray6))
                    .frame(width: 100, height: 100)
                    .overlay(
                        Image("userBig")
                            .resizable()
                            .frame(width: 37, height: 44)
                    )
            }
            
            PhotosPicker(selection: $viewModel.selectedItem, matching: .images, photoLibrary: .shared()) {
                Circle()
                    .fill(Color.black)
                    .frame(width: 30, height: 30)
                    .overlay(
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                    )
            }
            .onChange(of: viewModel.selectedItem) {
                Task {
                    if let data = try? await viewModel.selectedItem?.loadTransferable(type: Data.self),
                       let uiImage = UIImage(data: data) {
                        viewModel.selectedImage = uiImage
                    }
                }
            }
        }
        
    }
    
    
}

#Preview {
    ProfileEditView()
}
