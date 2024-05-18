//
//  NoInternetView.swift
//  TravelScheduler
//
//  Created by Алишер Дадаметов on 17.05.2024.
//

import SwiftUI

struct NoInternetView: View {
    var body: some View {
        VStack {
            Image("no_internet_image")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 223, height: 223)
            
            Text("Нет интернета")
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(.ypBlack)
        }
        .background(.ypWhite)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: CustomBackButton())
    }
}

struct NoInternetView_Previews: PreviewProvider {
    static var previews: some View {
        NoInternetView()
    }
}

