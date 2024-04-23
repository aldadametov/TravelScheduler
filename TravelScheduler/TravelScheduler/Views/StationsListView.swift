//
//  StationsListView.swift
//  TravelScheduler
//
//  Created by Алишер Дадаметов on 23.04.2024.
//

import SwiftUI

struct StationListView: View {
    @State private var searchString = ""
    var stations: [Station]
    var selectAction: (String) -> Void
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            SearchBar(searchText: $searchString)
            List {
                ForEach(stations.filter { station in
                    searchString.isEmpty || station.title.localizedCaseInsensitiveContains(searchString)
                }, id: \.self) { station in
                    Button(action: {
                        selectAction(station.title)
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Text(station.title)
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




