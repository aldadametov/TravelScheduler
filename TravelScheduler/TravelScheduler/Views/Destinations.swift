//
//  Destinations.swift
//  TravelScheduler
//
//  Created by Алишер Дадаметов on 17.05.2024.
//

import Foundation

enum Destination: Hashable, Equatable {
    case cityListFrom
    case cityListTo
    case stationList(city: City)
    case tripsListView
    case tripFilterView
    case carrierDetail(CarrierModel)
    case storiesView
}
