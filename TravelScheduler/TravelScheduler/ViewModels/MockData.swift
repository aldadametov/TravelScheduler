//
//  MockData.swift
//  TravelScheduler
//
//  Created by Алишер Дадаметов on 19.05.2024.
//

import Foundation

enum TimeIntervalEnum: String, CaseIterable {
    case morning = "Утро 08:00 - 12:00"
    case day = "День 12:00 - 18:00"
    case evening = "Вечер 18:00 - 00:00"
    case night = "Ночь 00:00 - 06:00"
}

enum MockData {
    static let carriers: [CarrierModel] = [
        CarrierModel(name: "РЖД", logo: "RZD", email: "info@rzd.ru", phone: "+74952222222"),
        CarrierModel(name: "ФГК", logo: "FGK", email: "info@fgk.ru", phone: "+74953333333"),
        CarrierModel(name: "Урал Логистика", logo: "URAL", email: "info@ural.ru", phone: "+74954444444")
    ]
    
    static let trips: [Trip] = {
        let rzd = carriers.first { $0.name == "РЖД" }!
        let fgk = carriers.first { $0.name == "ФГК" }!
        let ural = carriers.first { $0.name == "Урал Логистика" }!
        
        return [
            Trip(departureTime: "08:00", arrivalTime: "12:00", travelTime: "4 часа", carrier: rzd, hasTransfers: false, date: "23.04.2024"),
            Trip(departureTime: "09:00", arrivalTime: "13:00", travelTime: "4 часа", carrier: fgk, hasTransfers: true, date: "24.04.2024"),
            Trip(departureTime: "10:00", arrivalTime: "14:00", travelTime: "4 часа", carrier: ural, hasTransfers: false, date: "25.04.2024"),
            Trip(departureTime: "11:00", arrivalTime: "15:00", travelTime: "4 часа", carrier: rzd, hasTransfers: true, date: "26.04.2024")
        ]
    }()
    
    static let stories: [Story] = [
        Story(Image: "storyImage1", isViewed: false, title: "text, text, text, text, text, text, text, text", description: "text, text, text, text, text, text, text, text"),
        Story(Image: "storyImage2", isViewed: false, title: "text, text, text, text, text, text, text, text", description: "text, text, text, text, text, text, text, text"),
        Story(Image: "storyImage3", isViewed: false, title: "text, text, text, text, text, text, text, text", description: "text, text, text, text, text, text, text, text"),
        Story(Image: "storyImage4", isViewed: false, title: "text, text, text, text, text, text, text, text", description: "text, text, text, text, text, text, text, text"),
        Story(Image: "storyImage5", isViewed: false, title: "text, text, text, text, text, text, text, text", description: "text, text, text, text, text, text, text, text"),
        Story(Image: "storyImage6", isViewed: false, title: "text, text, text, text, text, text, text, text", description: "text, text, text, text, text, text, text, text"),
        Story(Image: "storyImage7", isViewed: false, title: "text, text, text, text, text, text, text, text", description: "text, text, text, text, text, text, text, text"),
        Story(Image: "storyImage8", isViewed: false, title: "text, text, text, text, text, text, text, text", description: "text, text, text, text, text, text, text, text"),
        Story(Image: "storyImage9", isViewed: false, title: "text, text, text, text, text, text, text, text", description: "text, text, text, text, text, text, text, text"),
        Story(Image: "storyImage10", isViewed: false, title: "text, text, text, text, text, text, text, text", description: "text, text, text, text, text, text, text, text"),
        Story(Image: "storyImage11", isViewed: false, title: "text, text, text, text, text, text, text, text", description: "text, text, text, text, text, text, text, text"),
        Story(Image: "storyImage12", isViewed: false, title: "text, text, text, text, text, text, text, text", description: "text, text, text, text, text, text, text, text"),
        Story(Image: "storyImage13", isViewed: false, title: "text, text, text, text, text, text, text, text", description: "text, text, text, text, text, text, text, text"),
        Story(Image: "storyImage14", isViewed: false, title: "text, text, text, text, text, text, text, text", description: "text, text, text, text, text, text, text, text"),
        Story(Image: "storyImage15", isViewed: false, title: "text, text, text, text, text, text, text, text", description: "text, text, text, text, text, text, text, text"),
        Story(Image: "storyImage16", isViewed: false, title: "text, text, text, text, text, text, text, text", description: "text, text, text, text, text, text, text, text"),
        Story(Image: "storyImage17", isViewed: false, title: "text, text, text, text, text, text, text, text", description: "text, text, text, text, text, text, text, text"),
        Story(Image: "storyImage18", isViewed: false, title: "text, text, text, text, text, text, text, text", description: "text, text, text, text, text, text, text, text"),
        
    ]
    
    static let cities: [City] = [
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
}
