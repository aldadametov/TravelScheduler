//
//  CarrierViewModel.swift
//  TravelScheduler
//
//  Created by Алишер Дадаметов on 17.05.2024.
//

import Foundation

@MainActor
final class CarriersViewModel: ObservableObject {
    @Published var carriers: [CarrierModel] = []
    

    func carrier(for name: String) -> CarrierModel? {
        return carriers.first { $0.name == name }
    }
}


