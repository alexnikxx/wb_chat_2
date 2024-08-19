//
//  MoreScreenView.swift
//  wb_chat_2
//
//  Created by Азамат Баев on 19.08.2024.
//
import SwiftUI
import UISystem

struct MoreScreenView: View {
    @State private var darkMode = false
    @State private var pushNotificationMode = true
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Ещё")
                .font(.title)
                .padding(.leading, 16)
            
            ScrollView {
                VStack(spacing: 16) {
                    privateView
                    userView
                    chatsView
                    themeView
                    pushView
                    safeView
                    memoryView
                    helpView
                    invintationView
                }
            }
            .padding(.leading, 16)
            .padding(.trailing, 16)
        }
    }
}
//MARK: Properties
extension MoreScreenView {
    
    var privateView: some View {
        DisclosureGroup {
            Text("Аккаунт")
        } label: {
            Image("userBig")
            VStack(alignment: .leading) {
                Text("Иван Иванов")
                    .foregroundStyle(.heading2)
                    .font(.bodyText1(.bold, size: 18))
                Text("+7 999 888 77 66")
                    .font(.metadat1(.regular, size: 16))
                    .foregroundStyle(.metadata2)
            }
        }
    }
    var userView: some View {
        DisclosureGroup {
            Text("Аккаунт")
        } label: {
            Image("usersmall")
            Text("Аккаунт")
                .font(.bodyText1(.semiBold))
                .foregroundStyle(.heading2)
        }
    }
    var chatsView: some View {
        DisclosureGroup {
            Text("Чаты")
        } label: {
            Image("message_circle")
                .resizable()
                .frame(width: 24, height: 24)
            Text("Чаты")
                .font(.bodyText1(.semiBold))
                .foregroundStyle(.heading2)
        }
    }
    var themeView: some View {
        HStack {
            Toggle(isOn: $darkMode) {
                HStack {
                    Image("sun")
                    Text("Тема")
                        .font(.bodyText1(.semiBold))
                        .foregroundStyle(.heading2)
                }
            }
            .padding(.trailing, 2)
        }
    }
    var pushView: some View {
        HStack {
            Toggle(isOn: $pushNotificationMode) {
                HStack {
                    Image("notification")
                    Text("Уведомления")
                        .font(.bodyText1(.semiBold))
                        .foregroundStyle(.heading2)
                }
            }
            .padding(.trailing, 2)
        }
    }
    var safeView: some View {
        DisclosureGroup {
                Text("Безопасность")
        } label: {
            Image("outline-privacy-tip")
            Text("Безопасность")
                .font(.bodyText1(.semiBold))
                .foregroundStyle(.heading2)
        }
    }
    var memoryView: some View {
        DisclosureGroup {
            Text("Память и ресурсы")
        } label: {
            Image("folder")
            Text("Память и ресурсы")
                .font(.bodyText1(.semiBold))
                .foregroundStyle(.heading2)
        }
    }
    var helpView: some View {
        DisclosureGroup {
            Text("Помощь")
        } label: {
            Image("help-circle")
            Text("Помощь")
                .font(.bodyText1(.semiBold))
                .foregroundStyle(.heading2)
        }
    }
    var invintationView: some View {
        DisclosureGroup {
            Text("Пригласи друга")
        } label: {
            Image("mail")
            Text("Пригласи друга")
                .font(.bodyText1(.semiBold))
                .foregroundStyle(.heading2)
        }
    }
}
#Preview {
    MoreScreenView()
}
