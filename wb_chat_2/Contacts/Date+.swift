//
//  Date+.swift
//  wb_chat_2
//
//  Created by Tatiana Lazarenko on 8/10/24.
//

import Foundation

//TODO: move this extension to UISystem
extension Date {
    func dateToString(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short
        return dateFormatter.string(from: date)
    }
}
