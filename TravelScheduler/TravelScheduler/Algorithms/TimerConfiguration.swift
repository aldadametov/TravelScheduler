//
//  TimerConfiguration.swift
//  TravelScheduler
//
//  Created by Алишер Дадаметов on 15.06.2024.
//
import Foundation

struct TimerConfiguration {
    let storiesCount: Int
    let timerTickInternal: TimeInterval
    let progressPerTick: CGFloat

    init(
        storiesCount: Int,
        secondsPerStory: TimeInterval = 10,
        timerTickInternal: TimeInterval = 0.25
    ) {
        self.storiesCount = storiesCount
        self.timerTickInternal = timerTickInternal
        self.progressPerTick = CGFloat(timerTickInternal / secondsPerStory)
    }
}
