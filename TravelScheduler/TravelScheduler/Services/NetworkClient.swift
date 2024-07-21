//
//  NetworkClient.swift
//  TravelScheduler
//
//  Created by Алишер Дадаметов on 20.07.2024.
//

import Foundation

actor NetworkClient {
    private let client: Client
    private let apikey: String
    
    init(client: Client, apikey: String) {
        self.client = client
        self.apikey = apikey
    }
    
    func fetchCities() async throws -> [City] {
        let service = StationsListService(client: client, apikey: apikey)
        let stationList = try await service.getAllStations(apiKey: apikey, lang: nil, format: nil)
        
        var cities: [City] = []
        for country in stationList.countries ?? [] {
            for region in country.regions ?? [] {
                for settlement in region.settlements ?? [] {
                    guard let cityTitle = settlement.title, !cityTitle.isEmpty else {
                        continue
                    }
                    let stations = settlement.stations?.compactMap { $0.title != nil ? Station(title: $0.title!) : nil } ?? []
                    let city = City(title: cityTitle, stations: stations)
                    cities.append(city)
                }
            }
        }
        return cities
    }
}
