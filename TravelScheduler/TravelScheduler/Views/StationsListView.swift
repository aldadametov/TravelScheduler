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
            if filteredStations.isEmpty {
                Spacer()
                Text("Станция не найдена")
                    .foregroundColor(.ypBlack)
                    .font(.system(size: 24, weight: .bold))
                    .padding()
                Spacer()
            } else {
                List {
                    ForEach(filteredStations, id: \.self) { station in
                        Button(action: {
                            selectedStation = station.title
                            selectAction(station.title)
                        }) {
                            HStack {
                                Text(station.title)
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.ypBlack)
                            }
                            .contentShape(Rectangle())
                        }
                        .buttonStyle(PlainButtonStyle())
                        .listRowSeparator(.hidden)
                    }
                }
                .listStyle(.plain)
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: CustomBackButton())
        .navigationTitle("Выбор Станции")
    }
    
    var filteredStations: [Station] {
        stations.filter { station in
            searchString.isEmpty || station.title.localizedCaseInsensitiveContains(searchString)
        }
    }
}







