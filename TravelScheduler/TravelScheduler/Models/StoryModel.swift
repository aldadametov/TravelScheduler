//
//  StoryModel.swift
//  TravelScheduler
//
//  Created by Алишер Дадаметов on 08.06.2024.
//

import Foundation

struct Story: Identifiable, Hashable {
    let id: Int
    let Image: String
    let isViewed: Bool
    let title: String
    let description: String

    func update(isNewViewed: Bool) -> Story {
        .init(id: id, Image: Image, isViewed: isNewViewed, title: title, description: description)
    }
}
