import SwiftUI

enum Destinations: Hashable{
    case NavigationView
    case PokemonEntry
}

struct PokedexHomeView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Image("background-start")
                VStack {
                    Text("IPhone Pokédex").font(.system(size: 36)).foregroundColor(.white)
                    Spacer()
                    NavigationLink(value: 0) {Circle()
                            .opacity(0)
                            .frame(width: 120)
                            .padding(.bottom, 45)
                    }
                    Spacer()
                }.padding(.vertical, 200)
            }.navigationDestination(for: Int.self) { _ in
                NavigationView()
            }
        }
    }
}

struct PokedexHomeView_Previews: PreviewProvider {
    static var previews: some View {
        PokedexHomeView()
    }
}
