//
//  Font+.swift
//  wb_chat_2
//
//  Created by Tatiana Lazarenko on 8/10/24.
//

import SwiftUI

//TODO: move this file to UISystem
extension Font {
    static func heading1(_ size: CGFloat = 32) -> Font {
        .system(size: size, weight: .bold, design: .none)
    }
    
    static func heading2(_ size: CGFloat = 24) -> Font {
        .system(size: size, weight: .bold, design: .none)
    }
    
    static func subheading1(_ size: CGFloat = 18) -> Font {
        .system(size: size, weight: .semibold, design: .none)
    }
    
    static func subheading2(_ size: CGFloat = 16) -> Font {
        .system(size: size, weight: .semibold, design: .none)
    }
    
    static func bodyText1(_ size: CGFloat = 14) -> Font {
        .system(size: size, weight: .semibold, design: .none)
    }
    
    static func bodyText2(_ size: CGFloat = 14) -> Font {
        .system(size: size, weight: .regular, design: .none)
    }
    
    static func metadata1(_ size: CGFloat = 12) -> Font {
        .system(size: size, weight: .regular, design: .none)
    }
    
    static func metadata2(_ size: CGFloat = 10) -> Font {
        .system(size: size, weight: .regular, design: .none)
    }
    
    static func metadata3(_ size: CGFloat = 10) -> Font {
        .system(size: size, weight: .semibold, design: .none)
    }
}
