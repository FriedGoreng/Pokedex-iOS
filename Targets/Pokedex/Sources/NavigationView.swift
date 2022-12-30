// Kanto Pokedex --> Leave it simple for now.
// Navigation Stack will increase complexity here when we introduce regions
//As well as sorters and other things
import SwiftUI
import RequestsLive

struct PokeEntry: Hashable{
    let id: Int
}

struct NavigationView: View {
    //Store Pokedex Struct Array here
    //Store filter properties here so ForEach can grab filtered array
    //Also implement Search
    var body: some View {
            VStack{
                Text("Pokedex Entry").font(.system(size: 32)).padding()
                    List {
                        ForEach(1..<152) { el in
                            NavigationLink(value: PokeEntry(id: el)) {
                                NavigationItem(el, "Something")
                            }
                        }
                    }
            }.navigationDestination(for: PokeEntry.self) { entry in
                PokemonEntry(ContentViewModel(entry, .live(id: String(entry.id))))
            }
    }
}

struct NavigationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView()
    }
}
