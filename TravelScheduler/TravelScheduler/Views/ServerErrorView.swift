//
//  ServerErrorView.swift
//  TravelScheduler
//
//  Created by Алишер Дадаметов on 17.05.2024.
//

import SwiftUI

struct ServerErrorView: View {
    var body: some View {
        VStack {
            Image("server_error_image")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 223, height: 223)
            
            Text("Ошибка Сервера")
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(.ypBlack)
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: CustomBackButton())
    }
}

struct ServerErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ServerErrorView()
    }
}

