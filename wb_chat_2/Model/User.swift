//
//  User.swift
//  wb_chat_2
//
//  Created by Halil Yavuz on 18.08.2024.
//

import Foundation
import SwiftData

@Model
class User {
    var name: String
    var surname: String?
    var phoneNumber: String
    var avatar: String?
    
    init(name: String, surname: String? = nil, phoneNumber: String, avatar: String? = nil) {
        self.name = name
        self.surname = surname
        self.phoneNumber = phoneNumber
        self.avatar = avatar
    }
}