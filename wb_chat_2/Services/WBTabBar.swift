//
//  File.swift
//  
//
//  Created by Aleksandra Nikiforova on 12/08/24.
//

import SwiftUI

public enum Tab: CaseIterable {
    case contacts
    case chats
    case more

    var iconName: String {
        switch self {
        case .contacts:
            "group"
        case .chats:
            "message_circle"
        case .more:
            "more_horizontal"
        }
    }
}

struct WBTabBar: View {
    @EnvironmentObject var router: Router
    @Environment(\.colorScheme) var colorScheme

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
                        .renderingMode(.template)
                        .resizable()
                        .frame(width: 32, height: 32)
                        .foregroundStyle(router.selectedTabRoute == tab ? Color.accentColor : Color("heading2"))
                        .onTapGesture {
                            router.selectedTabRoute = tab
                        }
                }
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 32)
            }
            .padding(.bottom)
        }
    }
}
