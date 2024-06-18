//
//  StoryModel.swift
//  TravelScheduler
//
//  Created by Алишер Дадаметов on 08.06.2024.
//

import Foundation

struct Story: Identifiable, Hashable {
    let id = UUID()
    let Image: String
    var isViewed: Bool
    let title: String
    let description: String
}

