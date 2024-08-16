//
//  DetailScreenView.swift
//  wb_chat_2
//
//  Created by Азамат Баев on 14.08.2024.
//

import SwiftUI
import UISystem

struct DetailScreenView: View {
   
    private let allSocialMediaPlatforms = ["twitter", "instagram", "LinkedIn", "facebook"]
    let name: String
    let surname: String?
    let phoneNumber: String
    let avatar: String?
    let socialMediaLinks: [SocialMedia]
    @Environment (\.dismiss) private var dismiss
    
    var body: some View {
        
        VStack(spacing: 0) {
            avatarView
            HStack(spacing: 5) {
                Text(name)
                Text(surname ?? "")

            }
            .font(.heading2(.semiBold))
            .padding(.top, 20)
            Text(phoneNumber)
                .font(.subheading2(.regular))
                .foregroundColor(.body1)
                .padding(.top, 6)
                .padding(.bottom, 40)
        }
        
        HStack(spacing: 12) {
            ForEach(allSocialMediaPlatforms, id: \.self) { platform in
                let socialMediaLink = socialMediaLinks.first { $0.name == platform }
                let url = socialMediaLink?.url ?? ""
                SocialButton(imageName: platform, url: url)
            }
        }
        .padding(.top, 20)
        Spacer()
        
    }
    
    private var avatarView: some View {
        VStack {
            if let imageString = avatar,
               let imageData = Data(base64Encoded: imageString),
               let uiImage = UIImage(data: imageData) {
                Image(uiImage: uiImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 200, height: 200)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.gray, lineWidth: 1))
                    .padding(.top, 86)
                
            } else {
                let nameInitials = name.first
                let surnameInitials = surname?.first ?? Character(" ")
                let initials = "\(nameInitials ?? Character(" "))\(surnameInitials)"
                RoundedRectangle(cornerRadius: 1)
                
                    .fill(Color.button)
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 200, height: 200)
                    .clipShape(Circle())
                    .padding(.top, 86)
                
                    .overlay(
                        Text(initials)
                            .font(.heading1(.bold, size: 44))
                            .padding(.top, 90)
                            .foregroundColor(.white) )
                    .padding(.trailing, 12)
            }
        }
    }
}




#Preview {
    DetailScreenView(name: "Halil", surname: "Yavuz", phoneNumber: "+7 999 999-99-99", avatar: nil, socialMediaLinks: [SocialMedia.init(name: "twitter", nickname: "1")])
}
