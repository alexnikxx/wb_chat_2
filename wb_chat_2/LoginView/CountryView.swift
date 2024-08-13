//
//  CountryView.swift
//  wb_chat_2
//
//  Created by Aleksandra Nikiforova on 12/08/24.
//

import SwiftUI

struct CountryView: View {
    @State var selectedCountry: Country
    
    var body: some View {
        Menu {
            ForEach(Country.countries) { country in
                Button(action: {
                    selectedCountry = country
                }) {
                    HStack {
                        Text("\(country.flag) \(country.name)   \(country.code)")
                    }
                }
            }
        } label: {
            HStack {
                Text(selectedCountry.flag)
                Text(selectedCountry.code)
                    .foregroundColor(.gray)
            }
            .padding(.horizontal, 8)
            .padding(.vertical, 10)
            .foregroundStyle(.heading2)
            .background(Color.textfield)
            .clipShape(RoundedRectangle(cornerRadius: 4))
        }
    }
}
