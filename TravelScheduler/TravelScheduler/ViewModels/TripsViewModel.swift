//
//  TripsViewModel.swift
//  TravelScheduler
//
//  Created by Алишер Дадаметов on 17.05.2024.
//

import Foundation

class TripsViewModel: ObservableObject {
    @Published var trips: [Trip] = []
    @Published var filteredTrips: [Trip] = []
    @Published var filtersApplied: Bool = false
    
    private let carriersViewModel: CarriersViewModel
    
    init(carriersViewModel: CarriersViewModel) {
        self.carriersViewModel = carriersViewModel
        loadTrips()
    }

    func loadTrips() {
        let rzd = carriersViewModel.carrier(for: "РЖД")!
        let fgk = carriersViewModel.carrier(for: "ФГК")!
        let ural = carriersViewModel.carrier(for: "Урал Логистика")!
        
        trips = [
            Trip(departureTime: "08:00", arrivalTime: "12:00", travelTime: "4 часа", carrier: rzd, hasTransfers: false, date: "23.04.2024"),
            Trip(departureTime: "09:00", arrivalTime: "13:00", travelTime: "4 часа", carrier: fgk, hasTransfers: true, date: "24.04.2024"),
            Trip(departureTime: "10:00", arrivalTime: "14:00", travelTime: "4 часа", carrier: ural, hasTransfers: false, date: "25.04.2024"),
            Trip(departureTime: "11:00", arrivalTime: "15:00", travelTime: "4 часа", carrier: rzd, hasTransfers: true, date: "26.04.2024")
        ]
        filteredTrips = trips
    }

    func applyFilters(selectedTimes: Set<TimeIntervalEnum>, showTransfers: Bool?) {
        filteredTrips = trips.filter { trip in
            let matchesTime = selectedTimes.contains { interval in
                tripMatchesInterval(trip, interval: interval)
            }
            let matchesTransfer = showTransfers == nil || (showTransfers == false && trip.hasTransfers == false) || showTransfers == true
            return matchesTime && matchesTransfer
        }
        filtersApplied = !selectedTimes.isEmpty || showTransfers != nil
    }

    private func tripMatchesInterval(_ trip: Trip, interval: TimeIntervalEnum) -> Bool {
        guard let departureTime = parseTime(trip.departureTime) else {
            return false
        }
        
        switch interval {
        case .morning:
            return isTime(departureTime, inRangeFrom: "08:00", to: "12:00")
        case .day:
            return isTime(departureTime, inRangeFrom: "12:00", to: "18:00")
        case .evening:
            return isTime(departureTime, inRangeFrom: "18:00", to: "00:00")
        case .night:
            return isTime(departureTime, inRangeFrom: "00:00", to: "06:00")
        }
    }
    
    private func parseTime(_ timeString: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.date(from: timeString)
    }
    
    private func isTime(_ time: Date, inRangeFrom startTimeString: String, to endTimeString: String) -> Bool {
        guard
            let startTime = parseTime(startTimeString),
            let endTime = parseTime(endTimeString) else {
            return false
        }
        
        if startTime < endTime {
            return (startTime...endTime).contains(time)
        } else {
            return time >= startTime || time <= endTime
        }
    }
}


enum TimeIntervalEnum: String, CaseIterable {
    case morning = "Утро 08:00 - 12:00"
    case day = "День 12:00 - 18:00"
    case evening = "Вечер 18:00 - 00:00"
    case night = "Ночь 00:00 - 06:00"
}
