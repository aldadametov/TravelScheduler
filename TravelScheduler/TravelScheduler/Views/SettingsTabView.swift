//
//  SettingsTabView.swift
//  TravelScheduler
//
//  Created by Алишер Дадаметов on 23.04.2024.
//

import SwiftUI

struct SettingsTabView: View {
    @Binding var isDarkMode: Bool
    let termsOfServiceURL: URL
    
    var body: some View {
        VStack(spacing: 0) {
            Toggle("Темная тема", isOn: $isDarkMode)
                .padding()
            NavigationLink(destination: WebContentView(url: termsOfServiceURL)) {
                HStack {
                    Text("Пользовательское сошлашение")
                    Spacer()
                    Image(systemName: "chevron.right")
                }
            }
            .padding()
            Spacer()
            Text("Приложение использует API Яндекс.Расписания")
                .font(.system(size: 12))
                .padding()
            Text("Версия 1.0 Beta")
                .font(.system(size: 12))
                .padding()
        }
        .padding()
    }
}
