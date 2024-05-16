//
//  TripsListView.swift
//  TravelScheduler
//
//  Created by Алишер Дадаметов on 06.05.2024.
//

import SwiftUI

struct TripsListView: View {
    @ObservedObject var viewModel: TripsViewModel
    var fromCity: String
    var fromStation: String
    var toCity: String
    var toStation: String
    
    var body: some View {
        VStack {
            Text("\(fromCity) (\(fromStation)) → \(toCity) (\(toStation))")
                .font(.system(size: 24, weight: .bold))
                .padding()
            List(viewModel.filteredTrips) { trip in
                TripRowView(trip: trip)
                    .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            NavigationLink(destination: TripFilterView(viewModel: viewModel)) {
                HStack {
                    Text("Уточнить время")
                        .foregroundColor(.white)
                    
                    if viewModel.filtersApplied {
                        Circle()
                            .fill(Color.ypRed)
                            .frame(width: 8, height: 8)
                            .padding(.leading, 4)
                    }
                }
                .padding()
                .frame(width: 343, height: 60)
                .background(Color.ypBlue)
                .cornerRadius(16)
            }
            .padding()
            
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: CustomBackButton())
    }
}

