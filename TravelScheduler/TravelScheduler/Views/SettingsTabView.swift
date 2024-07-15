//
//  SettingsTabView.swift
//  TravelScheduler
//
//  Created by Алишер Дадаметов on 23.04.2024.
//

import SwiftUI

struct SettingsTabView: View {
    @ObservedObject var viewModel: SettingsViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            Toggle("Темная тема", isOn: $viewModel.isDarkMode)
                .padding()
                .tint(.ypBlue)
            if let url = viewModel.termsOfServiceURL {
                NavigationLink(destination: WebContentView(url: url)) {
                    HStack {
                        Text("Пользовательское соглашение")
                        Spacer()
                        Image(systemName: "chevron.right")
                    }
                }
                .padding()
            } else {
                Text("Недоступно")
                    .padding()
            }
            Spacer()
            Text("Приложение использует API «Яндекс.Расписания»")
                .font(.system(size: 12))
                .padding()
            Text("Версия 1.0 Beta")
                .font(.system(size: 12))
                .padding()
        }
        .padding()
        .background(.ypWhite)
    }
}

struct SettingsTabView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsTabView(viewModel: SettingsViewModel(isDarkMode: false))
    }
}
