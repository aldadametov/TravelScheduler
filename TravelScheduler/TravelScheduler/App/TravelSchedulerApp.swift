//
//  TravelSchedulerApp.swift
//  TravelScheduler
//
//  Created by Алишер Дадаметов on 18.03.2024.
//

import SwiftUI

@main
struct TravelSchedulerApp: App {
    
    @AppStorage("isDarkMode") var isDarkMode: Bool = false
    
    var body: some Scene {
        WindowGroup {
            SplashScreenView()
                .preferredColorScheme(isDarkMode ? .dark : .light)
        }
    }
}
