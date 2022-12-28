//Call the task async await API when the view loads at init time.
import SwiftUI
import Loadable
import Combine

class ContentViewModel: ObservableObject {
    @Published var content: Loadable<Pokemon, NSError> = Loadable<Pokemon, NSError>()
    var entry: PokeEntry
    var pokemonRequestCancellable: AnyCancellable?
    
    init(_ entry: PokeEntry) {
        self.entry = entry
        self.pokemonRequestCancellable = URLSession.shared.dataTaskPublisher(for: Pokemon.getWebURL(entry.id))
            .map{data, _ in data}
            .decode(type: Pokemon.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main) //changing UI must be done on main thread. 
            .sink(receiveCompletion: { _ in }, receiveValue: {[weak self] pokemon in
                print(pokemon.stats)
                self?.content.setLoadedState(pokemon)
            })
    }
}
struct PokemonEntry: View {
    @ObservedObject var viewModel: ContentViewModel
    
    init(_ viewModel: ContentViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        if case let .loaded(pokemon) = viewModel.content {
            VStack{
                HStack {
                    Helper.getPokemonImage(viewModel.entry.id).padding()
                    Spacer()
                    VStack {
                        Text(Helper.capitaliseFirst(pokemon.name))
                            .font(.title)
                        Text(Helper.generatePokedexValue(viewModel.entry.id))
                            .font(.title)
                        Text("The something Pokemon")
                            .font(.subheadline).padding(.init(top: 5, leading: 0, bottom: 0, trailing: 0))
                    }.padding()
                }
                StatsChart([])
                Text("HEY")
                Spacer()
                
            }.padding()
        } else {
            VStack {
                Text("Waiting")
            }
        }
    }
}

struct PokemonEntry_Previews: PreviewProvider {
    static var previews: some View {
        PokemonEntry(.init(.init(id: 1)))
    }
}
