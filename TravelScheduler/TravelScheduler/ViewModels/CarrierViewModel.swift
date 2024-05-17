//
//  CarrierViewModel.swift
//  TravelScheduler
//
//  Created by Алишер Дадаметов on 17.05.2024.
//

import Foundation

class CarriersViewModel: ObservableObject {
    @Published var carriers: [CarrierModel] = []
    
    init() {
        loadCarriers()
    }
    
    func loadCarriers() {
        carriers = [
            CarrierModel(name: "РЖД", logo: "RZD", email: "info@rzd.ru", phone: "+74952222222"),
            CarrierModel(name: "ФГК", logo: "FGK", email: "info@fgk.ru", phone: "+74953333333"),
            CarrierModel(name: "Урал Логистика", logo: "URAL", email: "info@ural.ru", phone: "+74954444444")
        ]
    }
    
    func carrier(for name: String) -> CarrierModel? {
        return carriers.first { $0.name == name }
    }
}


