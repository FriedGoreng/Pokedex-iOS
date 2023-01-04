import Foundation
import Combine

extension Requests {
    public static let bulbasaur = Self {
        Just(Pokemon(
            id: 1,
            name: "Bulbasaur",
            baseExperience: 50,
            height: 1,
            abilities: [],
            moves: [],
            types: [.init(name: "grass", url: "nan"), .init(name: "poison", url: "nan")],
            stats: Pokemon.Stats(hp: 45, atk: 49, def: 49, spAtk: 65, spDef: 65, speed: 45)
        )).setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
