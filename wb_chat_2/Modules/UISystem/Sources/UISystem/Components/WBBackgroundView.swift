//
//  SwiftUIView 2.swift
//  
//
//  Created by Aleksandra Nikiforova on 13/08/24.
//

import SwiftUI

public struct BackgroundView<Content: View>: View {
    let content: Content

    public init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    public var body: some View {
        ZStack {
            Color.CustomColors.background.ignoresSafeArea()
            content
        }
    }
}
