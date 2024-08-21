//
//  SFProDisplay.swift
//  UISystem
//
//  Created by Азамат Баев on 11.08.2024.
//

import SwiftUI

extension Font {
    public static func fontWB(size: CGFloat, weight: Weight = .regular) -> Font {
        return Font.custom("SF Pro Display", size: size).weight(weight)
    }

    ///для заголовков (пример: Введите код, Имя пользователя)
    public static let heading1 = fontWB(size: 32).weight(.bold)
    public static let heading2 = fontWB(size: 24).weight(.bold)

    ///для названия экранов и категорий (пример: Чаты, Профиль, Контакты))
    public static let subheading1 = fontWB(size: 18).weight(.semibold)

    ///для названия которое вбывает на кнопках (пример: Начать общаться, Продолжить )
    public static let subheading2 = fontWB(size: 16).weight(.semibold)

    ///для использования в текстфилде
    public static let bodyText1 = fontWB(size: 14).weight(.semibold)

    /// для использования в чате (пример: текст в сообщения которые отправляет пользователь)
    public static let bodyText2 = fontWB(size: 14).weight(.regular)

    /// для использования в статусе (например: Когда был в сети или последнее сообщение пользователя)
    public static let metadata1 = fontWB(size: 12).weight(.regular)
    public static let metadata2 = fontWB(size: 10).weight(.regular)
    public static let metadata3 = fontWB(size: 10).weight(.semibold)
}
