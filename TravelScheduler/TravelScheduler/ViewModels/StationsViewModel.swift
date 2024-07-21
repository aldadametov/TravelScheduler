//
//  StationsViewModel.swift
//  TravelScheduler
//
//  Created by Алишер Дадаметов on 15.07.2024.
//

import Foundation
import Combine

@MainActor
class StationListViewModel: ObservableObject {
    @Published var searchString: String = ""
    @Published var selectedStation: String?
    @Published var stations: [Station] = []
    
    var selectAction: (String) -> Void
    
    init(stations: [Station], selectAction: @escaping (String) -> Void) {
        self.stations = stations
        self.selectAction = selectAction
    }
    
    var filteredStations: [Station] {
        stations.filter { station in
            searchString.isEmpty || station.title.localizedCaseInsensitiveContains(searchString)
        }
    }
    
    func selectStation(_ station: String) {
        selectedStation = station
        selectAction(station)
    }
}
