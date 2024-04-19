import SwiftUI
import OpenAPIURLSession

struct MainScreenView: View {
    
    @State private var from = ""
    @State private var to = ""
    @AppStorage("isDarkMode") var isDarkMode: Bool = false
    private let termsOfServiceURL = URL(string: "https://yandex.ru/legal/practicum_offer/")! // распаковать
    
    var body: some View {
        NavigationStack{
            TabView {
                ZStack{
                    Rectangle()
                        .fill(Color.ypBlue)
                        .cornerRadius(20)
                        .frame(height: 128)
                    HStack{
                        ZStack{
                            Rectangle()
                                .fill(Color.ypWhite)
                                .frame(height:100)
                            VStack {
                                NavigationLink(destination: CityListView()) {
                                    TextField("Откуда", text: $from)
                                        .frame(height: 40)
                                        .background(Color.ypWhiteUniversal)
                                }
                                NavigationLink(destination: CityListView()) {
                                    TextField("Куда", text: $to)
                                        .frame(height: 40)
                                        .background(Color.ypWhiteUniversal)
                                }
                            }
                        }
                        .cornerRadius(20)
                        .padding(.leading, 20)
                        Button(action: {
                            
                        }) {
                            Image("СhangeButton")
                                .resizable()
                                .frame(width: 36, height: 36)
                                .padding(10)
                        }
                        Spacer()
                    }
                    
                }
                .padding(20)
                .tabItem {
                    Image(systemName: "arrow.up.message.fill")
                }
                VStack(spacing: 0){
                    HStack{
                        Toggle("Темная тема", isOn: $isDarkMode)
                    }
                    .padding()
                    NavigationLink(destination: WebContentView(url: termsOfServiceURL)) {
                        HStack{
                            Text("Пользовательское сошлашение")
                            Spacer()
                            Image(systemName: "chevron.right")
                        }
                    }
                    .padding()
                    Spacer()
                    Text("Приложение использует API Яндекс.Расписания")
                        .font(.system(size: 12))
                        .padding()
                    Text("Версия 1.0 Beta")
                        .font(.system(size: 12))
                        .padding()
                }
                .padding()
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

