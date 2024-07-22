//
//  CityModel.swift
//  TravelScheduler
//
//  Created by Алишер Дадаметов on 23.04.2024.
//

import Foundation

struct City: Identifiable, Hashable, Sendable  {
    let id = UUID()
    let title: String
    let stations: [Station]
}
