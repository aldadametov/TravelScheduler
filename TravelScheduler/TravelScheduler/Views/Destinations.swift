//
//  Destinations.swift
//  TravelScheduler
//
//  Created by Алишер Дадаметов on 17.05.2024.
//

import Foundation

enum Destination: Hashable {
    case cityListFrom
    case cityListTo
    case stationList(city: City)
    case tripsListView
    case tripFilterView
    case carrierDetail(CarrierModel)
    case storiesView

    static func == (lhs: Destination, rhs: Destination) -> Bool {
        switch (lhs, rhs) {
        case (.cityListFrom, .cityListFrom),
             (.cityListTo, .cityListTo),
             (.tripsListView, .tripsListView),
             (.tripFilterView, .tripFilterView),
             (.storiesView, .storiesView):
            return true
        case (.stationList(let lhsCity), .stationList(let rhsCity)):
            return lhsCity == rhsCity
        case (.carrierDetail(let lhsCarrier), .carrierDetail(let rhsCarrier)):
            return lhsCarrier == rhsCarrier
        default:
            return false
        }
    }

    func hash(into hasher: inout Hasher) {
        switch self {
        case .cityListFrom:
            hasher.combine("cityListFrom")
        case .cityListTo:
            hasher.combine("cityListTo")
        case .stationList(let city):
            hasher.combine(city)
        case .tripsListView:
            hasher.combine("tripsListView")
        case .tripFilterView:
            hasher.combine("tripFilterView")
        case .carrierDetail(let carrier):
            hasher.combine(carrier)
        case .storiesView:
            hasher.combine("storiesView")
        }
    }
}
