//
//  Indicator.swift
//  wb_chat_2
//
//  Created by Aleksandra Nikiforova on 19/08/24.
//

import SwiftUI

struct Indicator: View {
    var body: some View {
        Rectangle()
            .frame(width: 160, height: 4)
            .foregroundStyle(.button)
            .clipShape(
                .rect(
                    topLeadingRadius: 20,
                    bottomLeadingRadius: 0,
                    bottomTrailingRadius: 0,
                    topTrailingRadius: 20
                )
            )
    }
}

#Preview {
    Indicator()
}
