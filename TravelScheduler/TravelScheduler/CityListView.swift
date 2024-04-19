//
//  CityListView.swift
//  TravelScheduler
//
//  Created by Алишер Дадаметов on 17.04.2024.
//

import SwiftUI

struct CityListView: View {
    
    @State private var searchString = ""
    @StateObject var viewModel = SourceViewModel ()
    
    var body: some View {
        NavigationStack {
            VStack {
                SearchBar(searchText: $searchString)
                List {
                    ForEach(viewModel.cities) { city in
                        NavigationLink(destination: StationListView(stations: city.stations)) {
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
}

struct StationListView: View {
    
    @State private var searchString = ""
    var stations: [Station]
    
    var body: some View {
        VStack{
            SearchBar(searchText: $searchString)
            List(stations, id: \.self) { station in
                Text(station.title)
            }
            .listStyle(.plain)
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: CustomBackButton())
        .navigationTitle("Выбор Сатнции")
    }
}

#Preview {
    CityListView()
}
