import SwiftUI

struct MainTabView: View {
    @State private var showTabBar = true
    @AppStorage("isDarkMode") var isDarkMode: Bool = false
    
    var body: some View {
        let settingsViewModel = SettingsViewModel(isDarkMode: isDarkMode)
        
        NavigationStack {
            TabView {
                HomeTabView()
                    .tabItem {
                        Image(systemName: "arrow.up.message.fill")
                    }

                SettingsTabView(viewModel: settingsViewModel)
                    .tabItem {
                        Label("", systemImage: "gearshape.fill")
                    }
            }
            .onAppear {
                UITabBar.appearance().backgroundColor = .ypWhite
            }
            .tint(.ypBlack)
            .onChange(of: showTabBar) { oldValue, newValue in
                if !newValue {
                    hideTabBar()
                } else {
                    showTabBarAgain()
                }
            }
            .onChange(of: isDarkMode) { oldValue, newValue in
                settingsViewModel.isDarkMode = newValue
            }
            .onChange(of: settingsViewModel.isDarkMode) { oldValue, newValue in
                isDarkMode = newValue
            }
        }
    }

    private func hideTabBar() {
        UITabBar.appearance().isHidden = true
    }

    private func showTabBarAgain() {
        UITabBar.appearance().isHidden = false
    }
}

struct MainScreenView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
