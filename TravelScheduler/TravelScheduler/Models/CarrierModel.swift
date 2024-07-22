//
//  CarrierModel.swift
//  TravelScheduler
//
//  Created by Алишер Дадаметов on 17.05.2024.
//

import Foundation

struct CarrierModel: Hashable {
    let name: String
    let logo: String
    let email: String
    let phone: String

    // Добавляем соответствие протоколу Hashable
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(logo)
        hasher.combine(email)
        hasher.combine(phone)
    }

    static func == (lhs: CarrierModel, rhs: CarrierModel) -> Bool {
        return lhs.name == rhs.name &&
               lhs.logo == rhs.logo &&
               lhs.email == rhs.email &&
               lhs.phone == rhs.phone
    }
}
