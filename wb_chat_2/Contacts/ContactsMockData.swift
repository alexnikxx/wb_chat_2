//
//  ContactsMockData.swift
//  wb_chat_2
//
//  Created by Tatiana Lazarenko on 8/10/24.
//

import Foundation

struct Contacts {
    static let contacts: [Contact] = [
        Contact(
            name: "Анастасия",
            surname: "Иванова",
            avatar: nil,
            phoneNumber: "+7 999 999-99-99",
            onlineStatus: Date(timeIntervalSinceNow: -30 * 3600),
            haveStories: false,
            socialMediaLinks: [
                .facebook: "https://www.facebook.com/",
                .instagram: "https://www.instagram.com/",
                .twitter: "https://x.com/"
            ]
        ),
        Contact(
            name: "Петя",
            surname: nil,
            avatar: nil,
            phoneNumber: "+7 999 999-99-99",
            onlineStatus: Date(timeIntervalSinceNow: -5),
            haveStories: false,
            socialMediaLinks: [
                .facebook: "https://www.facebook.com/",
                .instagram: "https://www.instagram.com/",
                .linkedIn: "https://linkedin.com/",
                .twitter: "https://x.com/"
            ]
        ),
        Contact(
            name: "Маман",
            surname: nil,
            avatar: nil,
            phoneNumber: "+7 999 999-99-99",
            onlineStatus: Date(timeIntervalSinceNow: -3 * 3600),
            haveStories: true,
            socialMediaLinks: [
                .facebook: "https://www.facebook.com/",
                .instagram: "https://www.instagram.com/"
            ]
        ),
        Contact(
            name: "Арбуз",
            surname: "Дыня",
            avatar: nil,
            phoneNumber: "+7 999 999-99-99",
            onlineStatus: Date(timeIntervalSinceNow: -3),
            haveStories: false,
            socialMediaLinks: [
                .instagram: "https://www.instagram.com/",
                .linkedIn: "https://linkedin.com/",
                .twitter: "https://x.com/"
            ]
        ),
        Contact(
            name: "Иван",
            surname: "Иванов",
            avatar: nil,
            phoneNumber: "+7 999 999-99-99",
            onlineStatus: Date(timeIntervalSinceNow: -8),
            haveStories: false,
            socialMediaLinks: [
                .facebook: "https://www.facebook.com/",
                .linkedIn: "https://linkedin.com/"
            ]
        ),
        Contact(
            name: "Лиса",
            surname: "Алиса",
            avatar: nil,
            phoneNumber: "+7 999 999-99-99",
            onlineStatus: Date(timeIntervalSinceNow: -30 * 60),
            haveStories: true,
            socialMediaLinks: [
                .linkedIn: "https://linkedin.com/"
            ]
        )
    ]
}
