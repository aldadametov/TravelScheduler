//
//  BackgroundColorModifier.swift
//  TravelScheduler
//
//  Created by Алишер Дадаметов on 18.05.2024.
//

import SwiftUI

struct BackgroundView<Content: View>: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    let content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        ZStack {
            // Установка фона
            (colorScheme == .dark ? Color.red : Color.white)
                .edgesIgnoringSafeArea(.all)
            content
        }
    }
}
