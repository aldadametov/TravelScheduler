//
//  StoryView.swift
//  TravelScheduler
//
//  Created by Алишер Дадаметов on 10.06.2024.
//

import SwiftUI

struct StoryView: View {
    let story: Story

    var body: some View {
        ZStack {
            Image(story.Image)
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .clipShape(RoundedRectangle(cornerRadius: 40))
                .ignoresSafeArea()
            VStack {
                Spacer()
                VStack(alignment: .leading, spacing: 10) {
                    Text(story.title)
                        .font(.system(size: 34, weight: .bold))
                        .foregroundColor(.white)
                    Text(story.description)
                        .font(.system(size: 20, weight: .regular))
                        .lineLimit(3)
                        .foregroundColor(.white)
                }
                .padding(.init(top: 0, leading: 16, bottom: 40, trailing: 16))
            }
        }
    }
}

struct StoryView_Previews: PreviewProvider {
    static var previews: some View {
        StoryView(story: MockData.stories[0])
    }
}


