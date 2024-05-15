//
//  StationsListView.swift
//  TravelScheduler
//
//  Created by Алишер Дадаметов on 23.04.2024.
//

import SwiftUI

struct StationListView: View {
    @State private var searchString = ""
    @State private var selectedStation: String?
    var stations: [Station]
    var selectAction: (String) -> Void
    
    var body: some View {
        VStack {
            SearchBar(searchText: $searchString)
            List {
                ForEach(stations.filter { station in
                    searchString.isEmpty || station.title.localizedCaseInsensitiveContains(searchString)
                }, id: \.self) { station in
                    Button(action: {
                        selectedStation = station.title
                        selectAction(station.title)
                    }) {
                        Text(station.title)
                            .foregroundColor(selectedStation == station.title ? .blue : .black)
                    }
                }
            }
            .listStyle(.plain)
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: CustomBackButton())
        .navigationTitle("Выбор Станции")
    }
}







