//
//  SettingsViewModel.swift
//  TravelScheduler
//
//  Created by Алишер Дадаметов on 15.07.2024.
//

import Foundation
import Combine

class SettingsViewModel: ObservableObject {
    @Published var isDarkMode: Bool {
        didSet {
            UserDefaults.standard.set(isDarkMode, forKey: "isDarkMode")
        }
    }
    
    let termsOfServiceURLString = "https://yandex.ru/legal/practicum_offer/"
    
    init(isDarkMode: Bool) {
        self.isDarkMode = isDarkMode
    }
    
    var termsOfServiceURL: URL? {
        return URL(string: termsOfServiceURLString)
    }
}
