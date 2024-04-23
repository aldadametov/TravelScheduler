import SwiftUI

struct MainScreenView: View {
    @State private var from = ""
    @State private var to = ""
    @AppStorage("isDarkMode") var isDarkMode: Bool = false
    private let termsOfServiceURL = URL(string: "https://yandex.ru/legal/practicum_offer/")!

    var body: some View {
        NavigationStack {
            TabView {
                HomeTabView(from: $from, to: $to, selectFromAction: { selectedStation in
                    from = selectedStation
                }, selectToAction: { selectedStation in
                    to = selectedStation
                }, swapAction: {
                    swap(&from, &to)
                })
                .tabItem {
                    Image(systemName: "arrow.up.message.fill")
                }
                
                SettingsTabView(isDarkMode: $isDarkMode, termsOfServiceURL: termsOfServiceURL)
                .tabItem {
                    Label("", systemImage: "gearshape.fill")
                }
            }
        }
    }
}

struct MainScreenView_Previews: PreviewProvider {
    static var previews: some View {
        MainScreenView()
    }
}

