//
//  ContentView.swift
//  wb_chat_2
//
//  Created by Tatiana Lazarenko on 8/14/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var router = Router()
    
    var body: some View {
        NavigationStack(path: $router.path) {
            router.view(for: router.startScreen)
                .navigationDestination(for: Route.self) { view in
                    router.view(for: view)
                }
        }
        .environmentObject(router)
    }
}

#Preview {
    ContentView()
}

