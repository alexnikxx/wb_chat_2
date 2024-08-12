//
//  File.swift
//  
//
//  Created by Aleksandra Nikiforova on 12/08/24.
//

import SwiftUI

enum Tab: CaseIterable {
    case contacts
    case chats
    case more

    var iconName: String {
        switch self {
        case .contacts:
            "contacts"
        case .chats:
            "chats"
        case .more:
            "more"
        }
    }
}

struct WBTabBar: View {
    @Environment(\.colorScheme) var colorScheme
    @Binding var selectedTab: Tab

    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(Color("background"))
                .frame(height: 84)
                .shadow(
                    color: Color("heading2").opacity(colorScheme == .light ? 0.04 : 0),
                    radius: 12,
                    x: 0,
                    y: -1
                )

            HStack {
                ForEach(Tab.allCases, id: \.self) { tab in
                    Image(tab.iconName)
                        .foregroundStyle(selectedTab == tab ? Color.accentColor : Color("heading2"))
                        .onTapGesture {
                            selectedTab = tab
                        }
                }
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 32)
            }
            .padding(.bottom)
        }
    }
}
