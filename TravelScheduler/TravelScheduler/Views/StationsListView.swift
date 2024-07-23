//
//  StationsListView.swift
//  TravelScheduler
//
//  Created by Алишер Дадаметов on 23.04.2024.
//

import SwiftUI

struct StationListView: View {
    @ObservedObject var viewModel: StationListViewModel
    
    var body: some View {
        VStack {
            SearchBar(searchText: $viewModel.searchString)
            if viewModel.filteredStations.isEmpty {
                Spacer()
                Text("Станция не найдена")
                    .foregroundColor(.ypBlack)
                    .font(.system(size: 24, weight: .bold))
                    .padding()
                Spacer()
            } else {
                List {
                    ForEach(viewModel.filteredStations, id: \.self) { station in
                        Button(action: {
                            viewModel.selectStation(station)
                        }) {
                            HStack {
                                Text(station.title)
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.ypBlack)
                            }
                            .contentShape(Rectangle())
                        }
                        .buttonStyle(PlainButtonStyle())
                        .listRowSeparator(.hidden)
                    }
                    .listRowBackground(Color.ypWhite)
                }
                .background(.ypWhite)
                .listStyle(.plain)
            }
        }
        .background(.ypWhite)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: CustomBackButton())
        .navigationTitle("Выбор Станции")
    }
}
