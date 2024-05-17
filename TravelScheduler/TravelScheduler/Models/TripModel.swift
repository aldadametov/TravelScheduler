//
//  TripModel.swift
//  TravelScheduler
//
//  Created by Алишер Дадаметов on 02.05.2024.
//

import Foundation

struct Trip: Identifiable {
    let id = UUID()
    let departureTime: String
    let arrivalTime: String
    let travelTime: String
    let carrier: CarrierModel
    let hasTransfers: Bool
    let date: String
}
