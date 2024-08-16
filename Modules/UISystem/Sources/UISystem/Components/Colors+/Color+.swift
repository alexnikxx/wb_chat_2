//
//  Color+.swift
//  wb_chat_2
//
//  Created by Азамат Баев on 16.08.2024.
//

import SwiftUI
import Foundation
 extension Color {
     public enum CustomColors {
        ///основной цвет приложения используется на главных кнопках
        public static let mainWbColor = Color("button")
        ///цвет для использования на заднем фоне
        public static let background = Color("background")
        ///цвет для использования в текстфилде (пример: "Имя(обязательно)")
        public static let body1 = Color("body1")
        
        public static let buttonText = Color("buttonText")
        ///для жирного текста(пример: "Введите код")
        public static let heading2 = Color("heading2")
        ///для текста который который показывает когда юзер был в сети
        public static let metadata2 = Color("metadata2")
        ///подзаголовки(пример: "Профиль")
        public static let subheading2 = Color("subheading2")
        ///цвет текстфилда
        public static let textfield = Color("textfield")

    }
}
