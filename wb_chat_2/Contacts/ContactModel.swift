//
//  ContactModel.swift
//  wb_chat_2
//
//  Created by Tatiana Lazarenko on 8/10/24.
//

import Foundation

struct Contact: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let surname: String?
    let avatar: String?
    let phoneNumber: String
    let onlineStatus: Date
    let haveStories: Bool
    let socialMediaLinks: [SocialMedia]
    
    var fullname: String {
        "\(name) \(surname ?? "")"
    }
    
    var onlineStatusMessage: String {
        let timeDifference = Calendar.current.dateComponents([.second], from: onlineStatus, to: Date())
        guard let seconds = timeDifference.second else { return "error" }
        
        switch seconds {
        case 0...10:
            return "Online"
        case 11...60:
            return "Last seen \(seconds) seconds ago"
        case 61...3600:
            return "Last seen \(seconds / 60) minutes ago"
        case 3601...86400:
            return "Last seen \(seconds / 60 / 60) hours ago"
        case 86401...172800:
            return "Last seen yesterday"
        default:
            return "Last seen on \(onlineStatus.dateToString(date: onlineStatus))"
        }
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
           
    static func == (lhs: Contact, rhs: Contact) -> Bool {
        return lhs.id == rhs.id
    }
}

struct SocialMedia: Hashable {
    let name: SocialMediaName
    let link: String
    let image: String
}

enum SocialMediaName {
    case twitter
    case instagram
    case linkedIn
    case facebook
}
