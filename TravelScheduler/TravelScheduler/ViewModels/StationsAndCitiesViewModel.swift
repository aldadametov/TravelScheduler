//
//  SourceViewModel.swift
//  TravelScheduler
//
//  Created by Алишер Дадаметов on 17.04.2024.
//

import Foundation

class StationsAndCitiesViewModel: ObservableObject {
    
    @Published var cities: [City] = [
        City(title: "Москва", stations: [
            Station(title: "Курский Вокзал"),
            Station(title: "Казанский Вокзал"),
            Station(title: "Киевский Вокзал"),
            Station(title: "Ленинградский Вокзал")
        ]),
        City(title: "Санкт-Петербург", stations: [
            Station(title: "Московский Вокзал"),
            Station(title: "Витебский Вокзал"),
            Station(title: "Ладожский Вокзал"),
            Station(title: "Балтийский Вокзал")
        ]),
        City(title: "Сочи", stations: [
            Station(title: "Вокзал Сочи"),
            Station(title: "Вокзал Адлер"),
            Station(title: "Вокзал Лазаревская")
        ]),
        City(title: "Краснодар", stations: [
            Station(title: "Краснодар I"),
            Station(title: "Краснодар II")
        ]),
        City(title: "Горный Воздух", stations: [
            Station(title: "Горно-Алтайск"),
            Station(title: "Бийск"),
            Station(title: "Белокуриха")
        ]),
        City(title: "Омск", stations: [
            Station(title: "Омск-Пассажирский"),
            Station(title: "Омск-Западный")
        ]),
        City(title: "Казань", stations: [
            Station(title: "Казанский Вокзал"),
            Station(title: "Вокзал Казань-Южный")
        ])
    ]

    @Published var selectedStation: Station?
    @Published var trips: [Trip] = []
    
    init() {
        loadTrips()
    }

    func loadTrips() {
        trips = [
            Trip(departureTime: "08:00", arrivalTime: "12:00", travelTime: "4 часа", carrier: "РЖД", carrierLogo: "RZD", hasTransfers: false, date: "23.04.2024"),
            Trip(departureTime: "09:00", arrivalTime: "13:00", travelTime: "4 часа", carrier: "ФГК", carrierLogo: "FGK", hasTransfers: true, date: "24.04.2024"),
            Trip(departureTime: "10:00", arrivalTime: "14:00", travelTime: "4 часа", carrier: "Урал Логистика", carrierLogo: "URAL", hasTransfers: false, date: "25.04.2024"),
            Trip(departureTime: "11:00", arrivalTime: "15:00", travelTime: "4 часа", carrier: "РЖД", carrierLogo: "RZD", hasTransfers: true, date: "26.04.2024")
        ]
    }
    
    
}
