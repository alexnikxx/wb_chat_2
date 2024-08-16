//
//  Extension + View.swift
//  wb_chat_2
//
//  Created by Halil Yavuz on 16.08.2024.
//

import SwiftUI

extension View {
    func hideKeyboard() {
        let resign = #selector(UIResponder.resignFirstResponder)
        UIApplication.shared.sendAction(resign, to: nil, from: nil, for: nil)
    }
}
