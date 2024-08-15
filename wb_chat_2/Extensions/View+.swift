//
//  View+.swift
//  wb_chat_2
//
//  Created by Tatiana Lazarenko on 8/15/24.
//

import SwiftUI

extension View {
    func hideKeyboard() {
        let resign = #selector(UIResponder.resignFirstResponder)
        UIApplication.shared.sendAction(resign, to: nil, from: nil, for: nil)
    }
}
