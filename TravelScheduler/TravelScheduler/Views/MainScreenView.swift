import SwiftUI

struct MainScreenView: View {
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
            .onAppear(){
                UITabBar.appearance().backgroundColor = .ypWhite
            }
            .tint(.ypBlack)
            .onChange(of: showTabBar) { newValue in
                if !newValue {
                    hideTabBar()
                } else {
                    showTabBarAgain()
                }
            }
            .onChange(of: isDarkMode) { newValue in
                settingsViewModel.isDarkMode = newValue
            }
            .onChange(of: settingsViewModel.isDarkMode) { newValue in
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
        MainScreenView()
    }
}
