import Foundation
import Requests
import Combine

extension Requests {
    public static func live(id: String) -> Requests {
        Self {
            URLSession.shared.dataTaskPublisher(for: URL(string: "https://pokeapi.co/api/v2/pokemon/\(id)")!)
                .map{data, _ in data}
                .decode(type: Pokemon.self, decoder: JSONDecoder())
                .receive(on: DispatchQueue.main)
                .eraseToAnyPublisher()
        }
    }
}
