//
//  HomeTabView.swift
//  TravelScheduler
//
//  Created by Алишер Дадаметов on 23.04.2024.
//

import SwiftUI
import OpenAPIURLSession

struct HomeTabView: View {
    @ObservedObject private var viewModel: HomeViewModel
    
    init() {
        let client = Client(serverURL: try! Servers.server1(), transport: URLSessionTransport())
        let networkClient = NetworkClient(client: client, apikey: "9b2141ce-cb26-49a7-8937-1d1925023295")
        _viewModel = ObservedObject(wrappedValue: HomeViewModel(networkClient: networkClient))
    }
    
    var body: some View {
        NavigationStack(path: $viewModel.path) {
            VStack {
                Spacer()
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 15) {
                        ForEach(viewModel.stories) { story in
                            StoryPreview(story: story)
                                .onTapGesture {
                                    viewModel.selectStory(story)
                                }
                        }
                    }
                    .padding()
                }
                .padding(.top, -250)
                
                ZStack {
                    Rectangle()
                        .fill(Color.ypBlue)
                        .cornerRadius(20)
                        .frame(height: 128)
                    HStack {
                        ZStack {
                            Rectangle()
                                .fill(Color.ypWhiteUniversal)
                                .frame(height: 100)
                            VStack {
                                TextField("Откуда", text: Binding(get: {
                                    viewModel.fromStation?.title ?? ""
                                }, set: { _ in }), prompt: Text("Откуда").foregroundColor(.ypGray))
                                    .padding(.leading, 10)
                                    .frame(height: 40)
                                    .background(Color.ypWhiteUniversal)
                                    .multilineTextAlignment(.leading)
                                    .foregroundColor(.ypBlackUniversal)
                                    .onTapGesture {
                                        viewModel.selectCityList(isFrom: true)
                                    }
                                
                                TextField("Куда", text: Binding(get: {
                                    viewModel.toStation?.title ?? ""
                                }, set: { _ in }), prompt: Text("Куда").foregroundColor(.ypGray))
                                    .padding(.leading, 10)
                                    .frame(height: 40)
                                    .background(Color.ypWhiteUniversal)
                                    .multilineTextAlignment(.leading)
                                    .foregroundColor(.ypBlackUniversal)
                                    .onTapGesture {
                                        viewModel.selectCityList(isFrom: false)
                                    }
                            }
                        }
                        .cornerRadius(20)
                        .padding(.leading, 20)
                        Button(action: {
                            viewModel.swapStations()
                        }) {
                            Image("СhangeButton")
                                .resizable()
                                .frame(width: 36, height: 36)
                                .padding(10)
                        }
                        Spacer()
                    }
                }
                .padding()
                .padding(.top, -80)
                if viewModel.isSearchButtonEnabled {
                    NavigationLink(value: Destination.tripsListView) {
                        Text("Найти")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.ypBlue)
                            .cornerRadius(16)
                    }
                    .frame(width: 150, height: 60)
                    .background(Color.ypBlue)
                    .foregroundColor(.white)
                    .cornerRadius(16)
                }
                Spacer()
            }
            .onAppear {
                viewModel.showTabBar = true
            }
            .navigationDestination(for: Destination.self) { destination in
                switch destination {
                case .cityListFrom:
                    CityListView(viewModel: viewModel.citiesViewModelInstance, selectAction: { selectedStation in
                        viewModel.updateStation(selectedStation, isFrom: true)
                    }, path: $viewModel.path)
                    .onAppear {
                        viewModel.showTabBar = true
                    }
                case .cityListTo:
                    CityListView(viewModel: viewModel.citiesViewModelInstance, selectAction: { selectedStation in
                        viewModel.updateStation(selectedStation, isFrom: false)
                    }, path: $viewModel.path)
                    .onAppear {
                        viewModel.showTabBar = true
                    }
                case .stationList(let city):
                    StationListView(viewModel: StationListViewModel(stations: city.stations, selectAction: { station in
                        if viewModel.path.contains(.cityListFrom) {
                            viewModel.updateStation(station, isFrom: true)
                        } else {
                            viewModel.updateStation(station, isFrom: false)
                        }
                        viewModel.resetPath()
                    }))
                    .onAppear {
                        viewModel.showTabBar = true
                    }
                case .tripsListView:
                    TripsListView(viewModel: viewModel.tripsViewModelInstance, path: $viewModel.path)
                        .onAppear {
                            viewModel.showTabBar = true
                        }
                case .tripFilterView:
                    TripFilterView(viewModel: viewModel.tripsViewModelInstance)
                        .onAppear {
                            viewModel.showTabBar = true
                        }
                case .carrierDetail(let carrier):
                    CarrierInfoView(carrier: carrier)
                        .onAppear {
                            viewModel.showTabBar = true
                        }
                case .storiesView:
                    StoriesView(stories: $viewModel.stories, isPresented: $viewModel.isStoriesViewPresented, currentStoryIndex: viewModel.currentStoryIndex, currentProgress: $viewModel.currentProgress)
                        .onAppear {
                            viewModel.showTabBar = true
                        }
                }
            }
        }
        .background(Color.ypWhite)
        .edgesIgnoringSafeArea(.all)
    }
}
