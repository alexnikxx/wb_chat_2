//
//  Country.swift
//  wb_chat_2
//
//  Created by Aleksandra Nikiforova on 12/08/24.
//

import Foundation

struct Country: Identifiable, Hashable {
     let id = UUID()
     let name: String
     let flag: String
     let code: String
     let digits: Int

     static let countries: [Country] = [
            Country(name: "Armenia", flag: "am", code: "+374", digits: 10),
            Country(name: "Azerbaijan", flag: "az", code: "+994", digits: 10),
            Country(name: "Belarus", flag: "by", code: "+375", digits: 10),
            Country(name: "China", flag: "cn", code: "+86", digits: 10),
            Country(name: "United Kingdom", flag: "gb", code: "+44", digits: 10),
            Country(name: "Kyrgyzstan", flag: "kg", code: "+996", digits: 10),
            Country(name: "Kazakhstan", flag: "kz", code: "+7", digits: 10),
            Country(name: "Russia", flag: "ru", code: "+7", digits: 10),
            Country(name: "USA", flag: "us", code: "+1", digits: 10),
            Country(name: "Uzbekistan", flag: "uz", code: "+998", digits: 10),
            Country(name: "Turkey", flag: "tr", code: "+90", digits: 10),
            Country(name: "Georgia", flag: "ge", code: "+995", digits: 10),
            Country(name: "South Korean", flag: "kr", code: "+82", digits: 10),
            Country(name: "United Arab Emirates", flag: "ae", code: "+971", digits: 10),
        ]
 }
