//
//  TripsListView.swift
//  TravelScheduler
//
//  Created by Алишер Дадаметов on 06.05.2024.
//

import SwiftUI

struct TripsListView: View {
    @ObservedObject var viewModel: StationsAndCitiesViewModel

    var body: some View {
        Text("Москва (Ярославский вокзал) → Санкт Петербург (Балтийский вокзал)")
            .font(.system(size: 24, weight: .bold))
            .padding()
        List(viewModel.trips) { trip in
            TripRowView(trip: trip)
                .listRowSeparator(.hidden)
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: CustomBackButton())
        .listStyle(.plain)
//        .onAppear {
//
//        }
    }
}
