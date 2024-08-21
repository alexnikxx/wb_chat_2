//
//  ShakeAnimation.swift
//  WB
//
//  Created by Aleksandra Nikiforova on 25/07/24.
//

import SwiftUI

public struct ShakeAnimation: GeometryEffect {
    var shakeAmount: CGFloat = 10
    var shakeFrequency = 3
    public var animatableData: CGFloat

    public init(animatableData: CGFloat) {
        self.animatableData = animatableData
    }

    public func effectValue(size: CGSize) -> ProjectionTransform {
        ProjectionTransform(
            CGAffineTransform(
                translationX: shakeAmount * sin(animatableData * .pi * CGFloat(shakeFrequency)),
                y: 0
            )
        )
    }
}
