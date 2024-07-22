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
                    let stations: [Station] = settlement.stations?.compactMap { station in
                        if let title = station.title, let code = station.codes?.yandex_code {
                            return Station(title: title, code: code)
                        }
                        return nil
                    } ?? []
                    let city = City(title: cityTitle, stations: stations)
                    cities.append(city)
                }
            }
        }
        return cities
    }
    
    func searchRoutes(from: String, to: String, date: String) async throws -> [Trip] {
        let service = SearchService(client: client, apiKey: apikey)
        let searchResponse = try await service.searchSchedule(
            from: from,
            to: to,
            apiKey: apikey,
            format: "json",
            lang: "ru_RU",
            date: date
        )
        

        var trips: [Trip] = []
                

        if let segments = searchResponse.segments {
                for segment in segments {
                    if let fromStation = segment.from, let toStation = segment.to {
                        let trip = Trip(
                            departureTime: formatTime(dateString: segment.departure ?? ""),
                            arrivalTime: formatTime(dateString: segment.arrival ?? ""),
                            travelTime: formatTravelTime(seconds: segment.duration ?? 0),
                            carrier: CarrierModel(
                                name: segment.thread?.carrier?.title ?? "Неизвестный перевозчик",
                                logo: segment.thread?.carrier?.logo ?? "RZD",
                                email: segment.thread?.carrier?.email ?? "неизвестный_email",
                                phone: segment.thread?.carrier?.phone ?? "неизвестный_телефон"
                            ),
                            hasTransfers: segment.has_transfers ?? false,
                            date: formatDate(dateString: date)
                        )
                        trips.append(trip)
                    }
                }
            }
        return trips
    }

}
