//
//  WebContentView.swift
//  TravelScheduler
//
//  Created by Алишер Дадаметов on 19.04.2024.
//

import SwiftUI

struct WebContentView: View {
    let url: URL
    
    var body: some View {
        WebView(url: url)
            .navigationTitle("Пользовательское соглашение")
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: CustomBackButton())
    }
}



