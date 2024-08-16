//
//  EditAvatarView.swift
//  wb_chat_2
//
//  Created by Aleksandra Nikiforova on 16/08/24.
//

import SwiftUI

struct EditAvatarView: View {
    var body: some View {
        Image("userBig")
            .resizable()
            .scaledToFit()
            .frame(width: 56, height: 56)
            .padding(22)
            .background(Color.textfield)
            .cornerRadius(100)
            .overlay(
                Button {

                } label: {
                    Image(systemName: "plus.circle.fill")
                        .offset(CGSize(width: 37.0, height: 37.0))
                        .frame(width: 24, height: 24)
                        .foregroundStyle(.heading2)
                }
            )
    }
}

#Preview {
    EditAvatarView()
}
