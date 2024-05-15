//
//  HomeTabView.swift
//  TravelScheduler
//
//  Created by Алишер Дадаметов on 23.04.2024.
//

import SwiftUI

struct HomeTabView: View {
    @State private var from = ""
    @State private var to = ""
    @State private var path: [Destination] = []
    @StateObject var viewModel = StationsAndCitiesViewModel()
    @Binding var showTabBar: Bool

    var body: some View {
        NavigationStack(path: $path) {
            VStack {
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
                                TextField("Откуда", text: $from, prompt: Text("Откуда"))
                                    .padding(.leading, 10)
                                    .frame(height: 40)
                                    .background(Color.ypWhiteUniversal)
                                    .multilineTextAlignment(.leading)
                                    .onTapGesture {
                                        showTabBar = false
                                        path.append(.cityListFrom)
                                    }

                                TextField("Куда", text: $to, prompt: Text("Куда"))
                                    .padding(.leading, 10)
                                    .frame(height: 40)
                                    .background(Color.ypWhiteUniversal)
                                    .multilineTextAlignment(.leading)
                                    .onTapGesture {
                                        showTabBar = false
                                        path.append(.cityListTo)
                                    }
                            }
                        }
                        .cornerRadius(20)
                        .padding(.leading, 20)
                        Button(action: {
                            swap(&from, &to)
                        }) {
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
                    NavigationLink(value: Destination.tripsListView) {
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
            .navigationDestination(for: Destination.self) { destination in
                switch destination {
                case .cityListFrom:
                    CityListView(selectAction: { selectedStation in
                        from = selectedStation
                        showTabBar = true
                        path.removeLast()
                    }, path: $path)
                case .cityListTo:
                    CityListView(selectAction: { selectedStation in
                        to = selectedStation
                        showTabBar = true
                        path.removeLast()
                    }, path: $path)
                case .stationList(let city):
                    StationListView(stations: viewModel.cities.first(where: { $0.title == city })?.stations ?? [], selectAction: { station in
                        if path.contains(.cityListFrom) {
                            from = station
                        } else {
                            to = station
                        }
                        showTabBar = true
                        path = [] // Возвращаемся на главный экран
                    })
                case .tripsListView:
                    TripsListView(viewModel: viewModel)
                }
            }
        }
    }
}

struct HomeTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainScreenView()
    }
}

enum Destination: Hashable {
    case cityListFrom
    case cityListTo
    case stationList(city: String)
    case tripsListView
}
