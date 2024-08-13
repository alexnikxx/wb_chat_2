//
//  File.swift
//  
//
//  Created by Aleksandra Nikiforova on 12/08/24.
//

import SwiftUI

public struct WBBackButton: View {
    @Environment(\.presentationMode) var presentationMode

    public init() { }

    public var body: some View {
        Button {
            presentationMode.wrappedValue.dismiss()
        } label: {
            Image("Icon")
        }
    }
}
