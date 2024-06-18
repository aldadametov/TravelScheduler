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
    private let timerInterval: TimeInterval = 0.25
    private let storyDuration: TimeInterval = 10.0
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Color.ypBlackUniversal
                .ignoresSafeArea()
            
            TabView(selection: $currentStoryIndex) {
                ForEach(stories.indices, id: \.self) { index in
                    StoryView(story: stories[index])
                        .tag(index)
                        .onAppear {
                            currentProgress = 0
                        }
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
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
        .onAppear(perform: startTimer)
        .navigationBarBackButtonHidden(true)
    }
    
    private func startTimer() {
        Timer.scheduledTimer(withTimeInterval: timerInterval, repeats: true) { timer in
            if currentProgress >= 1 {
                timer.invalidate()
                moveToNextStory()
            }
        }
    }
    
    private func moveToNextStory() {
        if currentStoryIndex < stories.count - 1 {
            currentStoryIndex += 1
        } else {
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    private func moveToPreviousStory() {
        if currentStoryIndex > 0 {
            currentStoryIndex -= 1
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

