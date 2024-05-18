//
//  SourceViewModel.swift
//  TravelScheduler
//
//  Created by Алишер Дадаметов on 17.04.2024.
//

import Foundation

final class StationsViewModel: ObservableObject {
    @Published var cities: [City] = []
    
    init() {
        loadCities()
    }
    
    func loadCities() {
        cities = MockData.cities
    }
    
    func city(for station: String) -> String {
        for city in cities {
            if city.stations.contains(where: { $0.title == station }) {
                return city.title
            }
        }
        return ""
    }
}
