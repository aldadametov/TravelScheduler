//
//  StoriesView.swift
//  TravelScheduler
//
//  Created by Алишер Дадаметов on 15.06.2024.
//

//
//  StoriesView.swift
//  TravelScheduler
//
//  Created by Алишер Дадаметов on 15.06.2024.
//

import SwiftUI

struct StoriesView: View {
    let stories: [Story]
    @Binding var isPresented: Bool
    @State var currentStoryIndex: Int
    @State private var currentProgress: CGFloat = 0
    @Environment(\.presentationMode) var presentationMode
    private let timerConfiguration: TimerConfiguration

    init(stories: [Story], isPresented: Binding<Bool>, currentStoryIndex: Int) {
        self.stories = stories
        self._isPresented = isPresented
        self._currentStoryIndex = State(initialValue: currentStoryIndex)
        self.timerConfiguration = TimerConfiguration(storiesCount: stories.count)
    }

    var body: some View {
        ZStack(alignment: .topTrailing) {
            Color.ypBlackUniversal
                .ignoresSafeArea()

            StoriesTabView(stories: stories, currentStoryIndex: $currentStoryIndex)
                .onChange(of: currentStoryIndex) { oldValue, newValue in
                    didChangeCurrentIndex(oldIndex: oldValue, newIndex: newValue)
                }

            StoriesProgressBar(
                storiesCount: stories.count,
                timerConfiguration: timerConfiguration,
                currentProgress: $currentProgress
            )
            .padding(.top, 28)
            .onChange(of: currentProgress) { _, newValue in
                didChangeCurrentProgress(newProgress: newValue)
            }

            Button(action: {
                presentationMode.wrappedValue.dismiss()
                isPresented = false
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

    private func didChangeCurrentIndex(oldIndex: Int, newIndex: Int) {
        guard oldIndex != newIndex else { return }
        let progress = timerConfiguration.progress(for: newIndex)
        guard abs(progress - currentProgress) >= 0.01 else { return }
        withAnimation {
            currentProgress = progress
        }
    }

    private func didChangeCurrentProgress(newProgress: CGFloat) {
        let index = timerConfiguration.index(for: newProgress)
        guard index != currentStoryIndex else { return }
        withAnimation {
            currentStoryIndex = index
        }
    }
}
