//
//  ShakeAnimation.swift
//  WB
//
//  Created by Aleksandra Nikiforova on 25/07/24.
//

import SwiftUI

struct ShakeAnimation: GeometryEffect {
    var shakeAmount: CGFloat = 10
    var shakeFrequency = 3
    var animatableData: CGFloat

    func effectValue(size: CGSize) -> ProjectionTransform {
        ProjectionTransform(
            CGAffineTransform(
                translationX: shakeAmount * sin(animatableData * .pi * CGFloat(shakeFrequency)),
                y: 0
            )
        )
    }
}
