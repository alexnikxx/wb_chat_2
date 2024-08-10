//
//  Font+.swift
//  WB
//
//  Created by Aleksandra Nikiforova on 25/07/24.
//

import SwiftUI

extension Font {
    static func appFont(size: CGFloat, weight: Weight = .regular) -> Font {
        return Font.custom("SF Pro Display", size: size).weight(weight)
    }

    static let appTitle = appFont(size: 24).weight(.bold)
    static let appSmallText = appFont(size: 14).weight(.semibold)
}
