//
//  SourceViewModel.swift
//  TravelScheduler
//
//  Created by Алишер Дадаметов on 17.04.2024.
//

import Foundation

class SourceViewModel: ObservableObject {
    
    @Published var cities: [City] = [City(title: "Москва", stations: [Station(title: "Курский Вокзал"),
                                                                      Station(title: "Казанский Вокзал"),
                                                                      Station(title: "Киевский Вокзал"),
                                                                      Station(title: "Какой-то Вокзал"),]),
                                     City(title: "Санкт-Петербург", stations: [Station(title: "Московский Вокзал"),
                                                                      Station(title: "Восточный Вокзал"),
                                                                      Station(title: "Ташкентский Вокзал"),
                                                                      Station(title: "Волшебный Вокзал"),]),
                                    ]
}
