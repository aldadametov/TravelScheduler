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
    @StateObject var viewModel = StationsAndCitiesViewModel()
    var selectFromAction: (String) -> Void
    var selectToAction: (String) -> Void
    var swapAction: () -> Void
    
    var body: some View {
        VStack{
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
                                    .padding(.leading, 10)
                                    .frame(height: 40)
                                    .background(Color.ypWhiteUniversal)
                                    .multilineTextAlignment(.leading)

                            }
                            NavigationLink(destination: CityListView(selectAction: selectToAction)) {
                                TextField("Куда", text: $to, prompt: Text("Куда"))
                                    .padding(.leading, 10)
                                    .frame(height: 40)
                                    .background(Color.ypWhiteUniversal)
                                    .multilineTextAlignment(.leading)
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
            .padding(16)
            if !from.isEmpty && !to.isEmpty {
                NavigationLink(destination: TripsListView(viewModel: viewModel)) {
                    Text("Найти")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.ypBlue)
                        .cornerRadius(16)
                }
                .frame(width: 150, height: 60)
                .background(Color.ypBlue)
                .foregroundColor(.white)
                .cornerRadius(16)
            }
        }
    }
}

struct HomeTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainScreenView()
    }
}

