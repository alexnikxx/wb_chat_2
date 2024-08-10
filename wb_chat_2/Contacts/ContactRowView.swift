//
//  ContactsRowView.swift
//  wb_chat_2
//
//  Created by Tatiana Lazarenko on 8/10/24.
//

import SwiftUI

struct ContactRowView: View {
    let contact: Contact
    
    var body: some View {
        HStack(spacing: 12) {
            AvatarView(contact: contact)
                
            VStack(alignment: .leading, spacing: 2) {
                Text(contact.fullname)
                    .font(.bodyText1())
                    .foregroundStyle(Color("TextColor"))
                    .frame(height: 24)
                        
                Text(contact.onlineStatusMessage)
                    .font(.metadata1())
                    .foregroundStyle(Color("GreyColor"))
                    .frame(height: 20)
                    
                Spacer()
            }
            Spacer()
        }
        .frame(height: 56)
    }
}

struct AvatarView: View {
    let contact: Contact
    
    var body: some View {
        ZStack {
            contact.haveStories ? setStories() : nil
            setImage()
            contact.onlineStatusMessage == "Online" ? setStatus().position(x: 48, y: 6) : nil
                
            
        }
        .frame(width: 56, height: 56)
    }
    
    private func setStories() -> some View {
        RoundedRectangle(cornerRadius: 18)
            .fill(LinearGradient(
                gradient: Gradient(colors: [Color("BlueGradientLeft"), Color("BlueGradientRight")]),
                startPoint: .leading,
                endPoint: .trailing))
            .frame(width: 56, height: 56)
    }
    
    private func setImage() -> some View {
        if let image = contact.avatar {
            return AnyView(
                Image(image)
                .resizable()
                .frame(width: 48, height: 48)
                .overlay(
                    RoundedRectangle(cornerRadius: 14)
                    .stroke(Color("BackgroundColor"), lineWidth: 2)
                )
            )
        } else {
            let nameInitials = contact.name.first
            let surnameInitials = contact.surname?.first ?? Character("")
            let initials = "\(nameInitials ?? Character(""))\(surnameInitials)"
            
            return AnyView(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color("ActiveColor"))
                    .stroke(Color("BackgroundColor"), lineWidth: 2)
                    .frame(width: 48, height: 48)
                    .overlay(
                        Text(initials)
                            .foregroundColor(.white)
                            .font(.bodyText1())
                    )
            )
        }
    }
    
    private func setStatus() -> some View {
        Circle()
            .stroke(Color.white, lineWidth: 4)
            .fill(Color.green)
            .frame(width: 12, height: 12)
    }
}

#Preview {
    ContactRowView(contact: Contact(name: "Anne", surname: "Das", avatar: "Arbuz", phoneNumber: "+456", onlineStatus: .now, haveStories: true, socialMediaLinks: [SocialMedia(name: .facebook, link: "fgg", image: "fff")]))
}
