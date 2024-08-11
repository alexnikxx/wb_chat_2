//
//  SFProDisplay.swift
//  UISystem
//
//  Created by Азамат Баев on 11.08.2024.
//

import Foundation
import SwiftUI

public enum SFProDisplay: String, CaseIterable {
    case bold = "SFProDisplay-Bold"
    case semiBold = "SFProDisplay-Semibold"
    case regular = "SFProDisplay-Regular"
    
}

extension Font {
    public static func sfProDisplay(_ sfProDisplay: SFProDisplay, size: CGFloat) -> Font {
        return .custom(sfProDisplay.rawValue, size: size, relativeTo: .body)
    }
}

//регистрация шрифта
public struct SFProDisplayFont {
    public static func registerFonts() {
        SFProDisplay.allCases.forEach {
            registerFont(bundle: .module, fontName: $0.rawValue, fontExtension: "otf")
        }
    }
    fileprivate static func registerFont(bundle: Bundle, fontName: String, fontExtension: String) {
        guard let fontURL = bundle.url(forResource: fontName, withExtension: fontExtension),
              let fontDataProvider = CGDataProvider(url: fontURL as CFURL),
              let font = CGFont(fontDataProvider) else {
            fatalError("Couldn't create font from filename: \(fontName) with extension \(fontExtension)")
        }
        var error: Unmanaged<CFError>?
        CTFontManagerRegisterGraphicsFont(font, &error)
    }
}

