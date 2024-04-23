//
//  CustomBackButtonView.swift
//  TravelScheduler
//
//  Created by Алишер Дадаметов on 19.04.2024.
//

import SwiftUI

struct CustomBackButton: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var body: some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "chevron.left")
                .foregroundColor(.ypBlack)
        }
    }
}
