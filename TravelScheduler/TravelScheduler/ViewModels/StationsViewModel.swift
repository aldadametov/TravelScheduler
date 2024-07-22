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
    @Published var selectedStation: Station?
    @Published var stations: [Station] = []
    
    var selectAction: (Station) -> Void
    
    init(stations: [Station], selectAction: @escaping (Station) -> Void) {
        self.stations = stations
        self.selectAction = selectAction
    }
    
    var filteredStations: [Station] {
        stations.filter { station in
            searchString.isEmpty || station.title.localizedCaseInsensitiveContains(searchString)
        }
    }
    
    func selectStation(_ station: Station) {
        selectedStation = station
        selectAction(station)
    }
}
