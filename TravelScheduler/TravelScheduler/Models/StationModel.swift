//
//  StationModel.swift
//  TravelScheduler
//
//  Created by Алишер Дадаметов on 18.04.2024.
//

import Foundation

struct Station: Identifiable, Hashable {
    var id = UUID()
    var title: String
}

struct City: Identifiable, Hashable {
    var id = UUID()
    var title: String
    var stations: [Station]
}


