//
//  ContentView.swift
//  wb_chat_2
//
//  Created by Tatiana Lazarenko on 8/14/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var router = Router()
    @AppStorage("isRegistered") private var isRegistered: Bool = false

    var body: some View {
        NavigationStack(path: $router.path) {
            router.view(for: isRegistered ? .main : router.startScreen)
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

