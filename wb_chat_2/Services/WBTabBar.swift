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
            "contacts"
        case .chats:
            "chats"
        case .more:
            "more"
        }
    }
}

public struct WBTabBar: View {
    @EnvironmentObject var router: Router
    @Environment(\.colorScheme) var colorScheme

    public var body: some View {
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

struct CustomTabBarView: View {
    
    var body: some View {
        HStack {
            TabItemView(screen: .contacts, icon: "group")
            Spacer()
            TabItemView(screen: .chats, icon: "message_circle")
            Spacer()
            TabItemView(screen: .more, icon: "more_horizontal")
        }
        .padding(.horizontal, 30)
        .padding(.bottom, 40)
        .padding(.top, 20)
        .background(
            Color("background").shadow(color: .black.opacity(0.04), radius: 24, x: -1)
        )
    }
}
        
struct TabItemView: View {
    @EnvironmentObject var router: Router
    let screen: Tab
    let icon: String
    
    var body: some View {
        Button(action: {
            router.selectedTabRoute = screen
        }, label: {
            Image(icon)
                .renderingMode(.template)
                .resizable()
                .frame(width: 32, height: 32)
                .foregroundStyle(router.selectedTabRoute == screen ? Color.accentColor : Color("heading2"))
            }
        )
    }
}
