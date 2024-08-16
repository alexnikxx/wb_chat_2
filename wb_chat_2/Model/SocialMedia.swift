//
//  SocialMedia.swift
//  wb_chat_2
//
//  Created by Halil Yavuz on 15.08.2024.
//

import Foundation
import SwiftData

@Model
class SocialMedia {
    var name: String
    var nickname: String
    
    init(name: String, nickname: String) {
        self.name = name
        self.nickname = nickname
        
    }
    var url: String {
        switch name {
        case "twitter":
            return "https://twitter.com/\(nickname)"
        case "instagram":
            return "https://instagram.com/\(nickname)"
        case "linkedin":
            return "https://linkedin.com/in/\(nickname)"
        case "facebook":
            return "https://facebook.com/\(nickname)"
        default:
            return ""
        }
    }
}


