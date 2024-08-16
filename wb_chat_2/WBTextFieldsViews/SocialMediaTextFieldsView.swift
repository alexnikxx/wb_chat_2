//
//  SocialMediaTextFieldsView.swift
//  wb_chat_2
//
//  Created by Aleksandra Nikiforova on 16/08/24.
//

import SwiftUI
import UISystem

struct SocialMediaTextFieldsView: View {
    @Binding var twitter: String
    @Binding var instagram: String
    @Binding var linkedin: String
    @Binding var facebook: String

    var body: some View {
        VStack(spacing: 16) {
            WBTextField(placeholder: "twitter", text: $twitter)
            WBTextField(placeholder: "@instagram", text: $instagram)
            WBTextField(placeholder: "LinkedIn", text: $linkedin)
            WBTextField(placeholder: "facebook/profile", text: $facebook)
        }
    }
}
