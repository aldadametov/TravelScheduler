import SwiftUI
import OpenAPIURLSession

struct MainScreenView: View {
    
    @State private var from = ""
    @State private var to = ""
    
    var body: some View {
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
                            TextField("Откуда", text: $from)
                                .frame(height: 40)
                                .padding(.horizontal)
                                .background(Color.ypWhiteUniversal)
                            TextField("Куда", text: $to)
                                .frame(height: 40)
                                .padding(.horizontal)
                                .background(Color.ypWhiteUniversal)
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
//                    .foregroundStyle(.ypWhite, .ypBlack)
            }
            VStack{
                
            }
            .tabItem { 
                Label("", systemImage: "gearshape.fill")
//                    .foregroundStyle(.ypBlack, .ypBlack)
            }
        }
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainScreenView()
    }
}

