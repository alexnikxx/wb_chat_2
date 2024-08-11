//
//  ContentView.swift
//  wb_chat_2
//
//  Created by Aleksandra Nikiforova on 10/08/24.
//

import SwiftUI
import UISystem

struct ContentView: View {
    
    
    
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
                .font(.sfProDisplay(.semiBold, size: 44))
            Text("Hello, world!")
                .font(.sfProDisplay(.bold, size: 44))

        }
        .padding()
    }
}

#Preview {
    ContentView()
}
