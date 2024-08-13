//
//  SwiftUIView.swift
//  
//
//  Created by Азамат Баев on 12.08.2024.
//

import SwiftUI

public struct WBSearchBarView: View {
    @Binding var inputText: String
    
    public init(inputText: Binding<String>) {
        self._inputText = inputText
    }
    
    public var body: some View {
        HStack {
            Image("search")
                .foregroundColor(Color("body1"))
                .padding(.horizontal, 6)
            TextField(LocalizedStringKey("search"), text: $inputText)
                .textFieldStyle(PlainTextFieldStyle())
            
        }
        .padding(8)
        .background(Color("textfield"))
        .cornerRadius(4)
    }
}
