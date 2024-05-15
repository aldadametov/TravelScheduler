//
//  CityListView.swift
//  TravelScheduler
//
//  Created by Алишер Дадаметов on 17.04.2024.
//

import SwiftUI

struct CityListView: View {
    @State private var searchString = ""
    @StateObject var viewModel = StationsAndCitiesViewModel()
    var selectAction: (String) -> Void
    @Binding var path: [Destination]
    
    var body: some View {
        VStack {
            SearchBar(searchText: $searchString)
            List {
                ForEach(viewModel.cities.filter { city in
                    searchString.isEmpty || city.title.localizedCaseInsensitiveContains(searchString)
                }) { city in
                    Button(action: {
                        path.append(.stationList(city: city.title))
                    }) {
                        Text(city.title)
                    }
                }
            }
            .listStyle(.plain)
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: CustomBackButton())
        .navigationTitle("Выбор Города")
    }
}



