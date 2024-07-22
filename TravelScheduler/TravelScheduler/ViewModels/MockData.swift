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
//    static let carriers: [CarrierModel] = [
//        CarrierModel(name: "РЖД", logo: "RZD", email: "info@rzd.ru", phone: "+74952222222"),
//        CarrierModel(name: "ФГК", logo: "FGK", email: "info@fgk.ru", phone: "+74953333333"),
//        CarrierModel(name: "Урал Логистика", logo: "URAL", email: "info@ural.ru", phone: "+74954444444")
//    ]
    
//    static let trips: [Trip] = {
//        let rzd = carriers.first { $0.name == "РЖД" }!
//        let fgk = carriers.first { $0.name == "ФГК" }!
//        let ural = carriers.first { $0.name == "Урал Логистика" }!
//        
//        return [
//            Trip(departureTime: "08:00", arrivalTime: "12:00", travelTime: "4 часа", carrier: rzd, hasTransfers: false, date: "23.04.2024"),
//            Trip(departureTime: "09:00", arrivalTime: "13:00", travelTime: "4 часа", carrier: fgk, hasTransfers: true, date: "24.04.2024"),
//            Trip(departureTime: "10:00", arrivalTime: "14:00", travelTime: "4 часа", carrier: ural, hasTransfers: false, date: "25.04.2024"),
//            Trip(departureTime: "11:00", arrivalTime: "15:00", travelTime: "4 часа", carrier: rzd, hasTransfers: true, date: "26.04.2024")
//        ]
//    }()
    
    static let stories: [Story] = [
        Story(id: 0, Image: "storyImage1", isViewed: false, title: "text, text, text, text, text, text, text, text", description: "text, text, text, text, text, text, text, text"),
        Story(id: 1, Image: "storyImage2", isViewed: false, title: "text, text, text, text, text, text, text, text", description: "text, text, text, text, text, text, text, text"),
        Story(id: 2, Image: "storyImage3", isViewed: false, title: "text, text, text, text, text, text, text, text", description: "text, text, text, text, text, text, text, text"),
        Story(id: 3, Image: "storyImage4", isViewed: false, title: "text, text, text, text, text, text, text, text", description: "text, text, text, text, text, text, text, text"),
        Story(id: 4, Image: "storyImage5", isViewed: false, title: "text, text, text, text, text, text, text, text", description: "text, text, text, text, text, text, text, text"),
        Story(id: 5, Image: "storyImage6", isViewed: false, title: "text, text, text, text, text, text, text, text", description: "text, text, text, text, text, text, text, text"),
        Story(id: 6, Image: "storyImage7", isViewed: false, title: "text, text, text, text, text, text, text, text", description: "text, text, text, text, text, text, text, text"),
        Story(id: 7, Image: "storyImage8", isViewed: false, title: "text, text, text, text, text, text, text, text", description: "text, text, text, text, text, text, text, text"),
        Story(id: 8, Image: "storyImage9", isViewed: false, title: "text, text, text, text, text, text, text, text", description: "text, text, text, text, text, text, text, text"),
        Story(id: 9, Image: "storyImage10", isViewed: false, title: "text, text, text, text, text, text, text, text", description: "text, text, text, text, text, text, text, text"),
        Story(id: 10, Image: "storyImage11", isViewed: false, title: "text, text, text, text, text, text, text, text", description: "text, text, text, text, text, text, text, text"),
        Story(id: 11, Image: "storyImage12", isViewed: false, title: "text, text, text, text, text, text, text, text", description: "text, text, text, text, text, text, text, text"),
        Story(id: 12, Image: "storyImage13", isViewed: false, title: "text, text, text, text, text, text, text, text", description: "text, text, text, text, text, text, text, text"),
        Story(id: 13, Image: "storyImage14", isViewed: false, title: "text, text, text, text, text, text, text, text", description: "text, text, text, text, text, text, text, text"),
        Story(id: 14, Image: "storyImage15", isViewed: false, title: "text, text, text, text, text, text, text, text", description: "text, text, text, text, text, text, text, text"),
        Story(id: 15, Image: "storyImage16", isViewed: false, title: "text, text, text, text, text, text, text, text", description: "text, text, text, text, text, text, text, text"),
        Story(id: 16, Image: "storyImage17", isViewed: false, title: "text, text, text, text, text, text, text, text", description: "text, text, text, text, text, text, text, text"),
        Story(id: 17, Image: "storyImage18", isViewed: false, title: "text, text, text, text, text, text, text, text", description: "text, text, text, text, text, text, text, text"),
        
    ]
}
