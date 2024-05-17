//
//  SourceViewModel.swift
//  TravelScheduler
//
//  Created by Алишер Дадаметов on 17.04.2024.
//

import Foundation

class StationsViewModel: ObservableObject {
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
    
    func city(for station: String) -> String {
        for city in cities {
            if city.stations.contains(where: { $0.title == station }) {
                return city.title
            }
        }
        return ""
    }
}
