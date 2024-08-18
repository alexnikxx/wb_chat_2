//
//  ContactModel.swift
//  wb_chat_2
//
//  Created by Tatiana Lazarenko on 8/10/24.
//

import SwiftData
import Foundation


@Model
final class Contact: Hashable {
    var id: UUID
    var name: String
    var surname: String?
    var avatar: String?
    var phoneNumber: String
    @Transient var onlineStatus: Date? = Contact.randomOnlineStatus()
    @Transient var haveStories: Bool = Bool.random()
    var socialMediaLinks: [SocialMedia]
    
    init(id: UUID = UUID(), name: String, surname: String?, avatar: String?, phoneNumber: String, socialMediaLinks: [SocialMedia] = []) {
        self.id = id
        self.name = name
        self.surname = surname
        self.avatar = avatar
        self.phoneNumber = phoneNumber
        self.socialMediaLinks = socialMediaLinks
    }
    var fullname: String {
        "\(name) \(surname ?? "")"
    }
    var onlineStatusMessage: String {
        guard let onlineStatus = onlineStatus else {
            print("Online status is nil")
            return "Status unknown"
        }
        
        let timeDifference = Calendar.current.dateComponents([.second], from: onlineStatus, to: Date())
        guard let seconds = timeDifference.second else {
            print("Error calculating time difference")
            return "error"
        }
        
        switch seconds {
        case 0...60:
            return "Online"
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
    static func randomOnlineStatus() -> Date {
        let secondsInOneDay: TimeInterval = 24 * 60 * 60
        let randomTimeInterval = TimeInterval.random(in: -secondsInOneDay...0)
        return Date().addingTimeInterval(randomTimeInterval)
    }
}

