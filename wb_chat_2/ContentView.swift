//
//  ContentView.swift
//  wb_chat_2
//
//  Created by Aleksandra Nikiforova on 10/08/24.
//

import SwiftUI

struct ContentView: View {
    let test = TestingAPI()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            Button("test", action: test.performChatCompletion)

        }
        .padding()
    }
}

#Preview {
    ContentView()
}
