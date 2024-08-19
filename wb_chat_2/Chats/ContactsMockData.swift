//
//  ContactsMockData.swift
//  wb_chat_2
//
//  Created by Tatiana Lazarenko on 8/10/24.
//

import SwiftUI

struct Contacts {
    static let contacts: [Contact] = [
        Contact(
            id: UUID(),
            name: "Анастасия",
            surname: "Иванова",
            avatar: "Анастасия Иванова",
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
            avatar: "Петя",
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
            name: "Маман",
            surname: nil,
            avatar: "Маман",
            phoneNumber: "+7 999 999-99-99",
            hasMessages: false,
            socialMediaLinks: [
                SocialMedia(name: "facebook", nickname: "8"),
                SocialMedia(name: "instagram", nickname: "9")
            ]
        ),
        Contact(
            name: "Арбуз",
            surname: "Дыня",
            avatar: "Арбуз Дыня",
            phoneNumber: "+7 999 999-99-99",
            hasMessages: false,
            socialMediaLinks: [
                SocialMedia(name: "facebook", nickname: "10"),
                SocialMedia(name: "instagram", nickname: "11"),
                SocialMedia(name: "linkedin", nickname: "12")
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
        ),
        Contact(
            name: "Лиса",
            surname: "Алиса",
            avatar: nil,
            phoneNumber: "+7 999 999-99-99",
            hasMessages: false,
            socialMediaLinks: [
                SocialMedia(name: "linkedin", nickname: "15")
            ]
        )
    ]
}
