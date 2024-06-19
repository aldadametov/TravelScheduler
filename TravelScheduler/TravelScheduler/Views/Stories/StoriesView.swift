//
//  StoriesView.swift
//  TravelScheduler
//
//  Created by Алишер Дадаметов on 15.06.2024.
//

import SwiftUI

struct StoriesView: View {
    @Binding var stories: [Story]
    @Binding var currentStoryIndex: Int
    @Binding var isPresented: Bool
    @State private var currentProgress: CGFloat = 0
    @Environment(\.presentationMode) var presentationMode
    @State private var timer: Timer?
    private let timerConfiguration: TimerConfiguration

    init(stories: Binding<[Story]>, currentStoryIndex: Binding<Int>, isPresented: Binding<Bool>) {
        self._stories = stories
        self._currentStoryIndex = currentStoryIndex
        self._isPresented = isPresented
        self.timerConfiguration = TimerConfiguration(storiesCount: stories.wrappedValue.count)
    }

    var body: some View {
        ZStack(alignment: .topTrailing) {
            Color.ypBlackUniversal
                .ignoresSafeArea()

            StoriesTabView(stories: stories, currentStoryIndex: $currentStoryIndex)
                .onAppear {
                    resetProgress()
                    startTimer()
                }
                .onDisappear {
                    stopTimer()
                }
                .gesture(DragGesture().onEnded { gesture in
                    if gesture.translation.width < 0 {
                        moveToNextStory()
                    } else if gesture.translation.width > 0 {
                        moveToPreviousStory()
                    }
                })

            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Image("CloseButton")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .padding(.top, 50)
                    .padding(.trailing, 16)
            }
        }
        .navigationBarBackButtonHidden(true)
    }

    private func startTimer() {
        stopTimer()
        timer = Timer.scheduledTimer(withTimeInterval: timerConfiguration.timerTickInternal, repeats: true) { timer in
            withAnimation {
                currentProgress += timerConfiguration.progressPerTick
            }
            if currentProgress >= 1 {
                timer.invalidate()
                moveToNextStory()
            }
        }
    }

    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }

    private func resetProgress() {
        currentProgress = 0
    }

    private func moveToNextStory() {
        if currentStoryIndex < stories.count - 1 {
            currentStoryIndex += 1
            resetProgress()
            startTimer()
        } else {
            presentationMode.wrappedValue.dismiss()
        }
    }

    private func moveToPreviousStory() {
        if currentStoryIndex > 0 {
            currentStoryIndex -= 1
            resetProgress()
            startTimer()
        }
    }
}

struct StoriesView_Previews: PreviewProvider {
    static var previews: some View {
        StoriesView(
            stories: .constant(MockData.stories),
            currentStoryIndex: .constant(0),
            isPresented: .constant(true)
        )
    }
}

