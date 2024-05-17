//
//  HomeTabView.swift
//  TravelScheduler
//
//  Created by Алишер Дадаметов on 23.04.2024.
//

import SwiftUI

struct HomeTabView: View {
    @State private var fromStation = ""
    @State private var toStation = ""
    @State private var path: [Destination] = []
    @StateObject var citiesViewModel = StationsViewModel()
    @StateObject var tripsViewModel = TripsViewModel(carriersViewModel: CarriersViewModel())
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
                                .fill(Color.ypWhiteUniversal)
                                .frame(height: 100)
                            VStack {
                                TextField("Откуда", text: $fromStation, prompt: Text("Откуда").foregroundColor(.ypGray))
                                    .padding(.leading, 10)
                                    .frame(height: 40)
                                    .background(Color.ypWhiteUniversal)
                                    .multilineTextAlignment(.leading)
                                    .foregroundColor(.ypBlackUniversal)
                                    .onTapGesture {
                                        showTabBar = false
                                        path.append(.cityListFrom)
                                    }

                                TextField("Куда", text: $toStation, prompt: Text("Куда").foregroundColor(.ypGray))
                                    .padding(.leading, 10)
                                    .frame(height: 40)
                                    .background(Color.ypWhiteUniversal)
                                    .multilineTextAlignment(.leading)
                                    .foregroundColor(.ypBlackUniversal)
                                    .onTapGesture {
                                        showTabBar = false
                                        path.append(.cityListTo)
                                    }
                            }
                        }
                        .cornerRadius(20)
                        .padding(.leading, 20)
                        Button(action: {
                            swap(&fromStation, &toStation)
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
                if !fromStation.isEmpty && !toStation.isEmpty {
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
                        fromStation = selectedStation
                        showTabBar = true
                        path.removeLast()
                    }, path: $path)
                case .cityListTo:
                    CityListView(selectAction: { selectedStation in
                        toStation = selectedStation
                        showTabBar = true
                        path.removeLast()
                    }, path: $path)
                case .stationList(let city):
                    StationListView(stations: citiesViewModel.cities.first(where: { $0.title == city })?.stations ?? [], selectAction: { station in
                        if path.contains(.cityListFrom) {
                            fromStation = station
                        } else {
                            toStation = station
                        }
                        showTabBar = true
                        path = [] // Возвращаемся на главный экран
                    })
                case .tripsListView:
                    let fromCity = citiesViewModel.city(for: fromStation)
                    let toCity = citiesViewModel.city(for: toStation)
                    TripsListView(viewModel: tripsViewModel, fromCity: fromCity, fromStation: fromStation, toCity: toCity, toStation: toStation, path: $path)
                case .tripFilterView:
                    TripFilterView(viewModel: tripsViewModel)
                case .carrierDetail(let carrier):
                    CarrierInfoView(carrier: carrier)
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

