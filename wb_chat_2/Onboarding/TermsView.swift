//
//  TermsView.swift
//  WB
//
//  Created by Aleksandra Nikiforova on 10/06/24.
//

import SwiftUI

struct TermsView: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack {
            Button {
                dismiss()
            } label: {
                Image(systemName: "xmark.circle.fill")
                    .resizable()
                    .frame(width: 24, height: 24)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .foregroundStyle(.gray)
            }
            .padding()

            Text("Пользовательское соглашение")
                .frame(maxHeight: .infinity, alignment: .center)
        }
    }
}

#Preview {
    TermsView()
}
