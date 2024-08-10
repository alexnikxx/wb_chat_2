//
//  SearchBarView.swift
//  wb_chat_2
//
//  Created by Tatiana Lazarenko on 8/10/24.
//

import SwiftUI

//TODO: move this file to UISystem
struct SearchBarView: View {
    @Binding var inputText: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(Color("GreyColor"))
                .padding(.horizontal, 6)
            TextField("Search", text: $inputText)
                .textFieldStyle(PlainTextFieldStyle())
            
        }
        .padding(8)
        .background(Color("InputColor"))
        .cornerRadius(4)
    }
}
