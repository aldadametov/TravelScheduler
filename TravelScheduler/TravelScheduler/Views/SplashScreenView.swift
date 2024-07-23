//
//  SplashScreenView.swift
//  TravelScheduler
//
//  Created by Алишер Дадаметов on 12.04.2024.
//

import SwiftUI

struct SplashScreenView: View {
    
    @State private var isActive = false
    
    var body: some View {
        if isActive == true {
            MainTabView()
        } else {
            Image("SplashScreen")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                        self.isActive = true
                    }
                }
        }
    }
}

#Preview {
    SplashScreenView()
}
