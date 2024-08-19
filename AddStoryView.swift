//
//  AddStoryView.swift
//  wb_chat_2
//
//  Created by Aleksandra Nikiforova on 19/08/24.
//

import SwiftUI

struct AddStoryView: View {
    var body: some View {
        VStack(spacing: 8) {
            ZStack {
                RoundedRectangle(cornerRadius: 16)
                    .foregroundColor(.textfield)
                    .frame(width: 56, height: 56)
                    .overlay(
                        RoundedRectangle(cornerRadius: 18)
                            .inset(by: 1)
                            .stroke(Color.storyStroke, lineWidth: 2)
                    )
                Image("plus")
            }

            Text("Вы")
                .font(.metadat1(.regular))
                .foregroundStyle(.heading2)
        }
    }
}

#Preview {
    AddStoryView()
}
