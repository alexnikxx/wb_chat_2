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
        BackgroundView {
            VStack {
                WBNavigationBar(
                    title: LocalizedStrings.contacts,
                    isBackButton: true,
                    rightButtonIcon: "pensil",
                    rightButtonAction: { router.navigateTo(.editContact(contact: contact)) },
                    backButtonAction: { router.navigateBack() }
                )

                VStack(spacing: 20) {
                    if let imageString = contact.avatar,
                       let imageData = Data(base64Encoded: imageString),
                       let uiImage = UIImage(data: imageData) {
                        Image(uiImage: uiImage)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 200, height: 200, alignment: .center)
                            .cornerRadius(100)
                    } else {
                        Image("userBig")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 112, height: 112)
                            .padding(44)
                            .background(Color.CustomColors.textfield)
                            .cornerRadius(100)
                    }

                    VStack(spacing: 40) {
                        VStack(spacing: 2) {
                            Text(contact.fullname)
                                .font(.fontWB(size: 24, weight: .semibold))
                                .foregroundStyle(Color.CustomColors.heading2)

                            Text(contact.phoneNumber)
                                .font(.fontWB(size: 16))
                                .foregroundStyle(Color.storyStroke)
                        }

                        HStack(spacing: 12) {
                            ForEach(allSocialMediaPlatforms, id: \.self) { platform in
                                let socialMediaLink = contact.socialMediaLinks.first { $0.name == platform }
                                let url = socialMediaLink?.url ?? ""
                                SocialButton(imageName: platform, url: url)
                            }
                        }
                    }
                }
                .padding(.top, 12)
            }
            .frame(maxHeight: .infinity, alignment: .top)
        }
    }
}

