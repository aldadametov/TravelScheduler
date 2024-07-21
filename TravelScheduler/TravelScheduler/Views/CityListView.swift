//
//  CityListView.swift
//  TravelScheduler
//
//  Created by Алишер Дадаметов on 17.04.2024.
//

import SwiftUI

struct CityListView: View {
    @State private var searchString = ""
    @StateObject private var viewModel: CitiesViewModel
    var selectAction: (String) -> Void
    @Binding var path: [Destination]
    
    init(selectAction: @escaping (String) -> Void, path: Binding<[Destination]>, networkClient: NetworkClient) {
        _viewModel = StateObject(wrappedValue: CitiesViewModel(networkClient: networkClient))
        self.selectAction = selectAction
        self._path = path
    }
    
    var body: some View {
        VStack {
            SearchBar(searchText: $searchString)
            if viewModel.isLoading {
                Spacer()
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
                    .padding()
                Spacer()
            } else if filteredCities.isEmpty {
                Spacer()
                Text("Город не найден")
                    .foregroundColor(.ypBlack)
                    .font(.system(size: 24, weight: .bold))
                    .padding()
                Spacer()
            } else {
                List {
                    ForEach(filteredCities) { city in
                        Button(action: {
                            if let city = viewModel.cities.first(where: { $0.title == city.title }) {
                                path.append(.stationList(city: city))
                            }
                        }) {
                            HStack {
                                Text(city.title)
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.ypBlack)
                            }
                            .contentShape(Rectangle())
                        }
                        .buttonStyle(PlainButtonStyle())
                        .listRowBackground(Color.ypWhite)
                    }
                    .listRowSeparator(.hidden)
                }
                .listStyle(.plain)
            }
        }
        .background(.ypWhite)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: CustomBackButton())
        .navigationTitle("Выбор Города")
        .task {
            if viewModel.cities.isEmpty {
                await viewModel.loadCities()
            }
        }
    }
    
    var filteredCities: [City] {
        viewModel.cities.filter { city in
            searchString.isEmpty || city.title.localizedCaseInsensitiveContains(searchString)
        }
    }
}
