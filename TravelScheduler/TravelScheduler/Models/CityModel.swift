//
//  CityModel.swift
//  TravelScheduler
//
//  Created by Алишер Дадаметов on 23.04.2024.
//

import Foundation

struct City: Identifiable, Hashable {
    var id = UUID()
    var title: String
    var stations: [Station]
}
