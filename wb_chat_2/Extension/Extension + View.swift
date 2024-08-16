//
//  Extension + View.swift
//  wb_chat_2
//
<<<<<<<< HEAD:wb_chat_2/Extensions/View+.swift
//  Created by Tatiana Lazarenko on 8/15/24.
========
//  Created by Halil Yavuz on 16.08.2024.
>>>>>>>> profilEdit_dataBase_codeRefactoring:wb_chat_2/Extension/Extension + View.swift
//

import SwiftUI

extension View {
    func hideKeyboard() {
        let resign = #selector(UIResponder.resignFirstResponder)
        UIApplication.shared.sendAction(resign, to: nil, from: nil, for: nil)
    }
}
