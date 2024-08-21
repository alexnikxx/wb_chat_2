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
        Country(name: LocalizedStrings.Countries.armenia, flag: "am", code: "+374", digits: 10),
        Country(name: LocalizedStrings.Countries.azerbaijan, flag: "az", code: "+994", digits: 10),
        Country(name: LocalizedStrings.Countries.belarus, flag: "by", code: "+375", digits: 10),
        Country(name: LocalizedStrings.Countries.china, flag: "cn", code: "+86", digits: 10),
        Country(name: LocalizedStrings.Countries.unitedKingdom, flag: "gb", code: "+44", digits: 10),
        Country(name: LocalizedStrings.Countries.kyrgyzstan, flag: "kg", code: "+996", digits: 10),
        Country(name: LocalizedStrings.Countries.kazakhstan, flag: "kz", code: "+7", digits: 10),
        Country(name: LocalizedStrings.Countries.russia, flag: "ru", code: "+7", digits: 10),
        Country(name: LocalizedStrings.Countries.usa, flag: "us", code: "+1", digits: 10),
        Country(name: LocalizedStrings.Countries.uzbekistan, flag: "uz", code: "+998", digits: 10),
        Country(name: LocalizedStrings.Countries.turkey, flag: "tr", code: "+90", digits: 10),
        Country(name: LocalizedStrings.Countries.georgia, flag: "ge", code: "+995", digits: 10),
        Country(name: LocalizedStrings.Countries.southKorean, flag: "kr", code: "+82", digits: 10),
        Country(name: LocalizedStrings.Countries.unitedArabEmirates, flag: "ae", code: "+971", digits: 10),
    ]
}
