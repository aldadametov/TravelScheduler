//
//  HomeTabView.swift
//  TravelScheduler
//
//  Created by Алишер Дадаметов on 23.04.2024.
//

import SwiftUI

struct HomeTabView: View {
    @Binding var from: String
    @Binding var to: String
    var selectFromAction: (String) -> Void
    var selectToAction: (String) -> Void
    var swapAction: () -> Void
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.ypBlue)
                .cornerRadius(20)
                .frame(height: 128)
            HStack {
                ZStack {
                    Rectangle()
                        .fill(Color.ypWhite)
                        .frame(height: 100)
                    VStack {
                        NavigationLink(destination: CityListView(selectAction: selectFromAction)) {
                            TextField("Откуда", text: $from, prompt: Text("Откуда"))
                                .frame(height: 40)
                                .background(Color.ypWhiteUniversal)
                        }
                        NavigationLink(destination: CityListView(selectAction: selectToAction)) {
                            TextField("Куда", text: $to, prompt: Text("Куда"))
                                .frame(height: 40)
                                .background(Color.ypWhiteUniversal)
                        }
                    }
                }
                .cornerRadius(20)
                .padding(.leading, 20)
                Button(action: swapAction) {
                    Image("СhangeButton")
                        .resizable()
                        .frame(width: 36, height: 36)
                        .padding(10)
                }
                Spacer()
            }
        }
        .padding(20)
    }
}
