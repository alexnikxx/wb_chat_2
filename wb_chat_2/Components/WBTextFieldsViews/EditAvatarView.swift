//
//  EditAvatarView.swift
//  wb_chat_2
//
//  Created by Aleksandra Nikiforova on 16/08/24.
//

import SwiftUI
import PhotosUI

struct EditAvatarView: View {
    @Binding var selectedImage: UIImage?
    @State private var isImagePickerPresented = false
    @State private var selectedItem: PhotosPickerItem? = nil
    
    var body: some View {
        VStack {
            ZStack {
                if let image = selectedImage {
                    Image(uiImage: image)
                        .resizable()
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                } else {
                    Image("userBig")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 56, height: 56)
                        .padding(22)
                        .background(Color.textfield)
                        .cornerRadius(100)
                }
                
                Button {
                    isImagePickerPresented = true
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundStyle(.heading2)
                        .background(Color.white)
                        .clipShape(Circle())
                }
                .offset(x: 40, y: 40)
            }
        }
        .photosPicker(isPresented: $isImagePickerPresented, selection: $selectedItem, matching: .images, photoLibrary: .shared())
        .onChange(of: selectedItem) {
            Task {
                if let data = try? await selectedItem?.loadTransferable(type: Data.self),
                   let uiImage = UIImage(data: data) {
                    selectedImage = uiImage
                }
            }
        }
    }
}

//#Preview {
//    EditAvatarView()
//}

