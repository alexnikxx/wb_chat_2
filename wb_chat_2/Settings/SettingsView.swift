//
//  MoreScreenView.swift
//  wb_chat_2
//
//  Created by Азамат Баев on 19.08.2024.
//
import SwiftUI
import UISystem

struct SettingsView: View {
    @State private var darkMode = false
    @State private var pushNotificationMode = true

    var body: some View {
        BackgroundView {
            VStack {
                WBNavigationBar(
                    title: "Еще",
                    isBackButton: false,
                    rightButtonIcon: "",
                    backButtonAction: { }
                )

                VStack(spacing: 32) {
                    privateView
                        .padding(.top, 16)

                    VStack(spacing: 16) {
                        userView
                        chatsView
                    }

                    VStack(spacing: 16) {
                        themeView
                        pushView
                        safeView
                        memoryView
                        Divider()
                            .background(Color.wBgray)
                        helpView
                        invintationView
                    }
                }
                .padding(.horizontal, 16)
                .frame(maxHeight: .infinity, alignment: .top)
            }
        }
    }
}
//MARK: Properties
extension SettingsView {
    var privateView: some View {
        DisclosureGroup {
            Text("Аккаунт")
        } label: {
            HStack(spacing: 20) {
                ZStack {
                    Circle()
                        .foregroundStyle(.wBgray)
                        .frame(width: 50, height: 50)

                    Image("userBig")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Иван Иванов")
                        .foregroundStyle(Color.CustomColors.heading2)
                        .font(.bodyText1)

                    Text("+7 999 888 77 66")
                        .font(.metadata1)
                        .foregroundStyle(Color.CustomColors.metadata2)
                }
            }
        }
        .accentColor(Color.CustomColors.heading2)
    }

    var userView: some View {
        DisclosureGroup {
            Text("Аккаунт")
        } label: {
            Image("usersmall")
            Text("Аккаунт")
                .font(.bodyText1)
                .foregroundStyle(Color.CustomColors.heading2)
        }
        .accentColor(Color.CustomColors.heading2)
    }

    var chatsView: some View {
        DisclosureGroup {
            Text("Чаты")
        } label: {
            Image("message_circle")
                .resizable()
                .frame(width: 24, height: 24)
            Text("Чаты")
                .font(.bodyText1)
                .foregroundStyle(Color.CustomColors.heading2)
        }
        .accentColor(Color.CustomColors.heading2)
    }

    var themeView: some View {
        HStack {
            Toggle(isOn: $darkMode) {
                HStack {
                    Image("sun")
                    Text("Тема")
                        .font(.bodyText1)
                        .foregroundStyle(Color.CustomColors.heading2)
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
                        .font(.bodyText1)
                        .foregroundStyle(Color.CustomColors.heading2)
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
                .font(.bodyText1)
                .foregroundStyle(Color.CustomColors.heading2)
        }
        .accentColor(Color.CustomColors.heading2)
    }

    var memoryView: some View {
        DisclosureGroup {
            Text("Память и ресурсы")
        } label: {
            Image("folder")
            Text("Память и ресурсы")
                .font(.bodyText1)
                .foregroundStyle(Color.CustomColors.heading2)
        }
        .accentColor(Color.CustomColors.heading2)
    }

    var helpView: some View {
        DisclosureGroup {
            Text("Помощь")
        } label: {
            Image("help-circle")
            Text("Помощь")
                .font(.bodyText1)
                .foregroundStyle(Color.CustomColors.heading2)
        }
        .accentColor(.heading2)
    }

    var invintationView: some View {
        DisclosureGroup {
            Text("Пригласи друга")
        } label: {
            Image("mail")
            Text("Пригласи друга")
                .font(.bodyText1)
                .foregroundStyle(Color.CustomColors.heading2)
        }
        .accentColor(.heading2)
    }
}
#Preview {
    SettingsView()
}
