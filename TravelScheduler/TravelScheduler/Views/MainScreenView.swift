import SwiftUI

struct MainScreenView: View {
    @State private var showTabBar = true
    @AppStorage("isDarkMode") var isDarkMode: Bool = false

    var body: some View {
        NavigationStack {
            TabView {
                HomeTabView(showTabBar: $showTabBar)
                    .tabItem {
                        Image(systemName: "arrow.up.message.fill")
                    }

                SettingsTabView(isDarkMode: $isDarkMode)
                    .tabItem {
                        Label("", systemImage: "gearshape.fill")
                    }
            }
            .accentColor(.ypBlack)
            .onChange(of: showTabBar) { newValue in
                if !newValue {
                    hideTabBar()
                } else {
                    showTabBarAgain()
                }
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

