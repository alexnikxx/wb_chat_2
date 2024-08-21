//
//  DetailScreenView.swift
//  wb_chat_2
//
//  Created by Азамат Баев on 14.08.2024.
//

import SwiftUI
import UISystem
import SwiftData

struct DetailScreenView: View {
    @EnvironmentObject var router: Router
    let contact: Contact
    
    private let allSocialMediaPlatforms = ["twitter", "instagram", "linkedin", "facebook"]
    @Environment (\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
            WBNavigationBar(
                title: LocalizedStrings.contacts,
                isBackButton: true,
                rightButtonIcon: "pensil",
                rightButtonAction: { router.navigateTo(.editContact(contact: contact)) },
                backButtonAction: { router.navigateBack() }, isSubtitle: false
            )
            
            VStack(spacing: 0) {
                if let imageString = contact.avatar,
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
                    RoundedRectangle(cornerRadius: 1)
                    
                        .fill(Color.CustomColors.mainWbColor)
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 200, height: 200)
                        .clipShape(Circle())
                        .padding(.top, 86)
                    
                        .overlay(
                            Text(initials(from: contact.fullname) )
                                .font(.heading1(.bold, size: 44))
                                .padding(.top, 90)
                                .foregroundColor(.white) )
                        .padding(.trailing, 12)
                    
                    Text(contact.fullname)
                        .font(.heading2(.semiBold))
                        .padding(.top, 20)
                    Text(contact.phoneNumber)
                        .font(.metadat1(.regular, size: 16))
                        .foregroundColor(.body1)
                        .padding(.top, 6)
                    
                    
                    HStack(spacing: 12) {
                        ForEach(allSocialMediaPlatforms, id: \.self) { platform in
                            let socialMediaLink = contact.socialMediaLinks.first { $0.name == platform }
                            let url = socialMediaLink?.url ?? ""
                            SocialButton(imageName: platform, url: url)
                        }
                    }
                    .padding(.top, 20)
                    
                    Spacer()
                }
            }
            .edgesIgnoringSafeArea(.top)
        }
    }
}
    
extension View {
    func initials(from name: String) -> String {
        let names = name.split(separator: " ")
        let initials = names.compactMap { $0.first }
        return initials.map(String.init).joined()
    }
}
