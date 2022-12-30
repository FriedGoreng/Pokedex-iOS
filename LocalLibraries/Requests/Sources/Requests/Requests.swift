import Combine

public struct Requests {
    public var fetchPokemonEntry: () -> AnyPublisher<Pokemon, Error>
    
    public init(fetchPokemonEntry: @escaping () -> AnyPublisher<Pokemon, Error>) {
        self.fetchPokemonEntry = fetchPokemonEntry
    }
}
