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
    
    init() {
        loadTrips()
    }

    func loadTrips() {
        trips = [
            Trip(departureTime: "08:00", arrivalTime: "12:00", travelTime: "4 часа", carrier: "РЖД", carrierLogo: "RZD", hasTransfers: false, date: "23.04.2024"),
            Trip(departureTime: "09:00", arrivalTime: "13:00", travelTime: "4 часа", carrier: "ФГК", carrierLogo: "FGK", hasTransfers: true, date: "24.04.2024"),
            Trip(departureTime: "10:00", arrivalTime: "14:00", travelTime: "4 часа", carrier: "Урал Логистика", carrierLogo: "URAL", hasTransfers: false, date: "25.04.2024"),
            Trip(departureTime: "11:00", arrivalTime: "15:00", travelTime: "4 часа", carrier: "РЖД", carrierLogo: "RZD", hasTransfers: true, date: "26.04.2024")
        ]
        filteredTrips = trips
    }

    func applyFilters(selectedTimes: Set<TimeInterval>, showTransfers: Bool?) {
        filteredTrips = trips.filter { trip in
            let matchesTime = selectedTimes.contains { interval in
                tripMatchesInterval(trip, interval: interval)
            }
            let matchesTransfer = showTransfers == nil || (showTransfers == false && trip.hasTransfers == false) || showTransfers == true
            return matchesTime && matchesTransfer
        }
        filtersApplied = !selectedTimes.isEmpty || showTransfers != nil
    }

    private func tripMatchesInterval(_ trip: Trip, interval: TimeInterval) -> Bool {
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
            // Если время перекрывает полночь (например, от 18:00 до 00:00 или от 00:00 до 06:00)
            return time >= startTime || time <= endTime
        }
    }
}

enum TimeInterval: String, CaseIterable {
    case morning = "Утро 08:00 - 12:00"
    case day = "День 12:00 - 18:00"
    case evening = "Вечер 18:00 - 00:00"
    case night = "Ночь 00:00 - 06:00"
}
