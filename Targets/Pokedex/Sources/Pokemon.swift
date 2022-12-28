import Foundation

struct Pokemon: Hashable, Decodable {
    let id: Int
    let name: String
    let baseExperience: Int
    let height: Int
    let abilities: [Ability]
    let moves: [Move]
    let types: [NameLink]
    let stats: [Stats]
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case baseExperience = "base_experience"
        case height
        case abilities
        case moves
        case types
        case stats
    }
    
    struct StatData: Hashable, Decodable {
        let baseStat: Int
        let effort: Int
        let stat: NameLink
        
        enum CodingKeys: String, CodingKey {
            case baseStat = "base_stat"
            case effort
            case stat
        }
    }
    
    struct Ability: Hashable, Decodable {
        let ability: NameLink
        let isHidden: Bool
        
        enum CodingKeys: String, CodingKey {
            case ability
            case isHidden = "is_hidden"
        }
    }
    
    struct Types: Hashable, Decodable {
        let type: NameLink
    }
    
    struct Move: Hashable, Decodable {
        let move: NameLink
    }
    
    struct NameLink: Hashable, Decodable {
        let name: String
        let url: String
    }
    
    enum Stats: Hashable, Decodable {
        case hp(StatData)
        case atk(StatData)
        case def(StatData)
        case spAtk(StatData)
        case spDef(StatData)
        case speed(StatData)
        
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: StatData.CodingKeys.self)
            let baseStat = try container.decode(Int.self, forKey: .baseStat)
            let effort = try container.decode(Int.self, forKey: .effort)
            let stat = try container.decode(NameLink.self, forKey: .stat)
            switch stat.name {
            case "hp":
                self = .hp(StatData(baseStat: baseStat, effort: effort, stat: stat))
            case "attack":
                self = .atk(StatData(baseStat: baseStat, effort: effort, stat: stat))
            case "defense":
                self = .def(StatData(baseStat: baseStat, effort: effort, stat: stat))
            case "special-attack":
                self = .spAtk(StatData(baseStat: baseStat, effort: effort, stat: stat))
            case "special-defense":
                self = .spDef(StatData(baseStat: baseStat, effort: effort, stat: stat))
            case "speed":
                self = .speed(StatData(baseStat: baseStat, effort: effort, stat: stat))
            default:
                fatalError("Could not parse types")
            }
        }
    }
}
extension Pokemon {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        baseExperience = try container.decode(Int.self, forKey: .baseExperience)
        height = try container.decode(Int.self, forKey: .height)
        abilities = try container.decode([Ability].self, forKey: .abilities)
        moves = []
        types = []
        stats = try container.decode([Stats].self, forKey: .stats)
    }
}

extension Pokemon {
    static func getWebURL(_ id: Int) -> URL {
        return URL(string: "https://pokeapi.co/api/v2/pokemon/\(id)")!
    }
}
