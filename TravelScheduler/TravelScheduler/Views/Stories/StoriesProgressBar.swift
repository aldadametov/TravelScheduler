//
//  StoriesProgressBAr.swift
//  TravelScheduler
//
//  Created by Алишер Дадаметов on 15.06.2024.
//

import SwiftUI
import Combine

struct StoriesProgressBar: View {
    let storiesCount: Int
    let timerConfiguration: TimerConfiguration
    @Binding var currentProgress: CGFloat
    @State private var timer: Timer.TimerPublisher
    @State private var cancellable: Cancellable?
    var onComplete: () -> Void

    init(storiesCount: Int, timerConfiguration: TimerConfiguration, currentProgress: Binding<CGFloat>, onComplete: @escaping () -> Void) {
        self.storiesCount = storiesCount
        self.timerConfiguration = timerConfiguration
        self._currentProgress = currentProgress
        self._timer = State(initialValue: Self.makeTimer(configuration: timerConfiguration))
        self.onComplete = onComplete
    }

    var body: some View {
        ProgressBar(numberOfSections: storiesCount, progress: currentProgress)
            .padding(.init(top: 7, leading: 12, bottom: 12, trailing: 12))
            .onAppear {
                timer = Self.makeTimer(configuration: timerConfiguration)
                cancellable = timer.connect()
            }
            .onDisappear {
                cancellable?.cancel()
            }
            .onReceive(timer) { _ in
                timerTick()
            }
    }

    private func timerTick() {
        withAnimation {
            currentProgress = timerConfiguration.nextProgress(progress: currentProgress)
            if currentProgress >= 1 {
                onComplete()
            }
        }
    }

    private static func makeTimer(configuration: TimerConfiguration) -> Timer.TimerPublisher {
        Timer.publish(every: configuration.timerTickInternal, on: .main, in: .common)
    }
}
