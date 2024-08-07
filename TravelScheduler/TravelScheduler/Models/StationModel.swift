//
//  StationModel.swift
//  TravelScheduler
//
//  Created by Алишер Дадаметов on 18.04.2024.
//

import Foundation

struct Station: Identifiable, Hashable, Sendable {
    let id = UUID()
    let title: String
    let code: String
}
