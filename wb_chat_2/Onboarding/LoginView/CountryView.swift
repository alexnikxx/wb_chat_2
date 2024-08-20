//
//  CountryView.swift
//  wb_chat_2
//
//  Created by Aleksandra Nikiforova on 12/08/24.
//

import SwiftUI
import UISystem

struct CountryView: View {
    @Binding var selectedCountry: Country
    
    var body: some View {
        Menu {
            ForEach(Country.countries) { country in
                Button(action: {
                    selectedCountry = country
                }) {
                    HStack {
                        setImage(country: country)
                        Text("\(country.name) \(country.code)")
                    }
                }
            }
        } label: {
            HStack {
                setImage(country: selectedCountry)
                Text(selectedCountry.code)
                    .foregroundColor(Color.CustomColors.heading2)
            }
            .padding(.horizontal, 8)
            .padding(.vertical, 10)
            .foregroundStyle(Color.CustomColors.heading2)
            .background(Color.CustomColors.textfield)
            .clipShape(RoundedRectangle(cornerRadius: 4))
        }
    }

    private func setImage(country: Country) -> some View {
        Image(country.flag)
            .resizable()
            .scaledToFit()
            .frame(width: 16, height: 16)
    }
}
