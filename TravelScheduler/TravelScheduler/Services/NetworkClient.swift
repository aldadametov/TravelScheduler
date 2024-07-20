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
    
    func fetchStations() async throws -> [City] {
        let service = StationsListService(client: client, apikey: apikey)
        let stationList = try await service.getAllStations(apiKey: apikey, lang: nil, format: nil)
        
        var cities: [City] = []
        for country in stationList.countries ?? [] {
            for region in country.regions ?? [] {
                for settlement in region.settlements ?? [] {
                    let stations = settlement.stations?.map { Station(title: $0.title ?? "Unknown") } ?? []
                    let city = City(title: settlement.title ?? "Unknown", stations: stations)
                    cities.append(city)
                }
            }
        }
        return cities
    }
}
