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
            Country(name: "Russia", flag: "🇷🇺", code: "+7", digits: 10),
            Country(name: "Turkey", flag: "🇹🇷", code: "+90", digits: 10),
            Country(name: "United States", flag: "🇺🇸", code: "+1", digits: 10),
        ]
 }
