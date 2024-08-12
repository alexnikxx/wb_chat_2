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
    public static func heading1(_ sfProDisplay: SFProDisplay, size: CGFloat = 32) -> Font {
        return .custom(sfProDisplay.rawValue, size: size, relativeTo: .body)
    }
    ///для заголовков(пример: Введите код, Имя пользователя)
    public static func heading2(_ sfProDisplay: SFProDisplay, size: CGFloat = 24) -> Font {
        return .custom(sfProDisplay.rawValue, size: size, relativeTo: .body)
    }
    ///для названия экранов и категорий(пример: Чаты, Профиль, Контакты))
    public static func subheading1(_ sfProDisplay: SFProDisplay, size: CGFloat = 18) -> Font {
        return .custom(sfProDisplay.rawValue, size: size, relativeTo: .body)
    }
    ///для названия которое вбывает на кнопках(пример: Начать общаться, Продолжить )
    public static func subheading2(_ sfProDisplay: SFProDisplay, size: CGFloat = 16) -> Font {
        return .custom(sfProDisplay.rawValue, size: size, relativeTo: .body)
    }
    ///для использования в текстфилде
    public static func bodyText1(_ sfProDisplay: SFProDisplay, size: CGFloat = 14) -> Font {
        return .custom(sfProDisplay.rawValue, size: size, relativeTo: .body)
    }
    /// для использования в чате(пример: текст в сообщения которые отправляет пользователь)
    public static func bodyText2(_ sfProDisplay: SFProDisplay, size: CGFloat = 12) -> Font {
        return .custom(sfProDisplay.rawValue, size: size, relativeTo: .body)
    }
    /// для использования в статусе(например: Когда был в сети или последнее сообщение пользователя))
    public static func metadat1(_ sfProDisplay: SFProDisplay, size: CGFloat = 10) -> Font {
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

