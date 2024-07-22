//
//  CarrierViewModel.swift
//  TravelScheduler
//
//  Created by Алишер Дадаметов on 17.05.2024.
//

import Foundation

final class CarriersViewModel: ObservableObject {
    @Published var carriers: [CarrierModel] = []
    
    init() {
//        loadCarriers()
    }
    
//    func loadCarriers() {
//        carriers = MockData.carriers
//    }
    
    func carrier(for name: String) -> CarrierModel? {
        return carriers.first { $0.name == name }
    }
}


