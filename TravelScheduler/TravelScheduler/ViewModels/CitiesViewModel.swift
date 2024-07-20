//
//  CitiesViewModel.swift
//  TravelScheduler
//
//  Created by Алишер Дадаметов on 17.04.2024.
//

import Foundation
import Combine

@MainActor
final class CitiesViewModel: ObservableObject {
    @Published var cities: [City] = []
    
    public let networkClient: NetworkClient
    
    init(networkClient: NetworkClient) {
        self.networkClient = networkClient
    }
    
    func loadCities() async {
        do {
            cities = try await networkClient.fetchStations()
        } catch {
            print("Ошибка при загрузке данных: \(error)")
        }
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
