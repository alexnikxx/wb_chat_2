//
//  Binding+.swift
//  wb_chat_2
//
//  Created by Aleksandra Nikiforova on 16/08/24.
//

import SwiftUI

extension Binding {
  func withDefault<T>(_ defaultValue: T) -> Binding<T> where Value == Optional<T> {
    return Binding<T>(get: {
      self.wrappedValue ?? defaultValue
    }, set: { newValue in
      self.wrappedValue = newValue
    })
  }
}
