//
//  LocalizedStrings.swift
//  wb_chat_2
//
//  Created by Halil Yavuz on 10.08.2024.
//

import Foundation

struct LocalizedStrings {
    enum Countries {
        static var armenia: String { NSLocalizedString("armenia", comment: "")}
        static var azerbaijan: String { NSLocalizedString("azerbaijan", comment: "")}
        static var belarus: String { NSLocalizedString("belarus", comment: "")}
        static var china: String { NSLocalizedString("china", comment: "")}
        static var unitedKingdom: String { NSLocalizedString("uk", comment: "")}
        static var kyrgyzstan: String { NSLocalizedString("kyrgyzstan", comment: "")}
        static var kazakhstan: String { NSLocalizedString("kazakhstan", comment: "")}
        static var russia: String { NSLocalizedString("russia", comment: "")}
        static var usa: String { NSLocalizedString("usa", comment: "")}
        static var uzbekistan: String { NSLocalizedString("uzbekistan", comment: "")}
        static var turkey: String { NSLocalizedString("turkey", comment: "")}
        static var georgia: String { NSLocalizedString("georgia", comment: "")}
        static var southKorean: String { NSLocalizedString("south_korean", comment: "")}
        static var unitedArabEmirates: String { NSLocalizedString("uae", comment: "")}
    }

    enum Onboarding {
        static var communicateWithFriends: String { NSLocalizedString("communicate_with_friends", comment: "")}
        static var pressingContinueButton: String { NSLocalizedString("pressing_button_continue", comment: "")}
        static var privacyPolicy: String { NSLocalizedString("privacy_policy", comment: "")}
        static var and: String { NSLocalizedString("and", comment: "")}
        static var termsOfUse: String { NSLocalizedString("terms_of_use", comment: "")}
        static var startChatting: String { NSLocalizedString("start_chatting", comment: "")}
    }

    enum Login {
        static var enterPhoneNumber: String { NSLocalizedString("enter_phone_number", comment: "")}
        static var conformationPhoneMessage: String { NSLocalizedString("confirmation_phone_message", comment: "")}
        static var continueButton: String { NSLocalizedString("continue", comment: "")}
    }

    enum Verification {
        static var enterCode: String { NSLocalizedString("enter_code", comment: "") }
        static var sentCodeToNumber: String { NSLocalizedString("sent_code_message", comment: "") }
        static var yourCode: String { NSLocalizedString("your_code", comment: "") }
        static var incorrectCodeTryAgain: String { NSLocalizedString("incorrect_code_try_again", comment: "") }
        static var requestCodeAgain: String { NSLocalizedString("request_code_again", comment: "") }
    }

    static var saveButton: String { NSLocalizedString("save_button", comment: "")}
    static var chats: String { NSLocalizedString("chats", comment: "")}
    static var contacts: String { NSLocalizedString("contacts", comment: "")}
    static var profile: String { NSLocalizedString("profile", comment: "")}
    
    static var searchTextField: String { NSLocalizedString("search", comment: "")}
    
    static var newContactTittle: String { NSLocalizedString("new_contact", comment: "")}
    static var nameTF: String { NSLocalizedString("name", comment: "")}
    static var surnameTF: String { NSLocalizedString("surname", comment: "")}
    
    static var settingsTittle: String { NSLocalizedString("settigs", comment: "")}
    
}
