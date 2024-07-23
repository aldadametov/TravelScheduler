//
//  CitiesViewModel.swift
//  TravelScheduler
//
//  Created by Алишер Дадаметов on 17.04.2024.
//

import Foundation
import Combine

@MainActor
final class CitiesViewModel: ObservableObject {
    @Published var cities: [City] = []
    @Published var isLoading: Bool = false
    
    public let networkClient: NetworkClient
    
    init(networkClient: NetworkClient) {
        self.networkClient = networkClient
    }
    
    func loadCities() async {
        isLoading = true
        defer { isLoading = false }

        do {
            let cities = try await networkClient.fetchCities()
            DispatchQueue.main.async {
                self.cities = cities
            }
        } catch {
            print("Error loading cities: \(error)")
        }
    }
}
