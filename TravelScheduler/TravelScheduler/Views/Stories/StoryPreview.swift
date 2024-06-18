//
//  StoryPreview.swift
//  TravelScheduler
//
//  Created by Алишер Дадаметов on 08.06.2024.
//

import SwiftUI

struct StoryPreview: View {
    let story: Story
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Image(story.Image)
                .resizable()
                .scaledToFill()
                .frame(width: 92, height: 140)
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .overlay(
                    RoundedRectangle(cornerRadius: 16 ).stroke(story.isViewed ? Color.clear : Color.blue, lineWidth: 4)
                )
                .opacity(story.isViewed ? 0.5 : 1.0)
            
            Text(story.title)
                .font(.system(size: 12, weight: .regular))
                .foregroundColor(.white)
                .lineLimit(3)
                .padding(.init(top: 83, leading: 8, bottom: 12, trailing: 8))
                .frame(width: 92, height: 140, alignment: .bottomLeading)
        }
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

struct StoryPreview_Previews: PreviewProvider {
    static var previews: some View {
        StoryPreview(story: MockData.stories[0])
    }
}
