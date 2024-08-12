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
            WBNavigationBar(
                title: "Профиль",
                isBackButton: true,
                rightButtonIcon: "pensil"
            )

            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
                .font(.heading1(.regular))
            WBButton(text: "Запросить код повторно", isFilled: false, action: { })
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .navigationBarBackButtonHidden()
        .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}
