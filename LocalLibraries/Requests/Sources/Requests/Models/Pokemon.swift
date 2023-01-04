import Foundation

public struct Pokemon: Hashable, Decodable {
    public let id: Int
    public let name: String
    public let baseExperience: Int
    public let height: Int
    public let abilities: [Ability]
    public let moves: [Move]
    public let types: [NameLink]
    public let stats: Stats
    
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
    
    public struct StatData: Hashable, Decodable {
        public let baseStat: Int
        public let effort: Int
        public let stat: NameLink
        
        public init(baseStat: Int, effort: Int, stat: NameLink) {
            self.baseStat = baseStat
            self.effort = effort
            self.stat = stat
        }
        
        enum CodingKeys: String, CodingKey {
            case baseStat = "base_stat"
            case effort
            case stat
        }
    }
    
    public struct Ability: Hashable, Decodable {
        public let ability: NameLink
        public let isHidden: Bool
        
        enum CodingKeys: String, CodingKey {
            case ability
            case isHidden = "is_hidden"
        }
    }
    
    public struct Move: Hashable, Decodable {
        let move: NameLink
    }
    
    public struct NameLink: Hashable, Decodable {
        public let name: String
        public let url: String
        
        public init(name: String, url: String) {
            self.name = name
            self.url = url
        }
    }
    
    public struct Stats: Hashable, Decodable {
        public private(set) var hp: StatData
        public private(set) var atk: StatData
        public private(set) var def: StatData
        public private(set) var spAtk: StatData
        public private(set) var spDef: StatData
        public private(set) var speed: StatData
        
        public init(hp: Int, atk: Int, def: Int, spAtk: Int, spDef: Int, speed: Int) {
            self.hp = .customMock(baseStat: hp, effort: 0)
            self.atk = .customMock(baseStat: atk, effort: 0)
            self.def = .customMock(baseStat: def, effort: 0)
            self.spAtk = .customMock(baseStat: spAtk, effort: 0)
            self.spDef = .customMock(baseStat: spDef, effort: 0)
            self.speed = .customMock(baseStat: speed, effort: 0)
        }

        public init(from decoder: Decoder) throws {
            hp = .mock
            atk = .mock
            def = .mock
            spAtk = .mock
            spDef = .mock
            speed = .mock
            
            var unkeyedContainer = try decoder.unkeyedContainer()
            guard let size = unkeyedContainer.count else {
                fatalError("Decoding Error")
            }
            
            for _ in 0..<size {
                let decodedStatData = try unkeyedContainer.decode(StatData.self)
                switch decodedStatData.stat.name {
                case "hp":
                    hp = decodedStatData
                    break
                case "attack":
                    atk = decodedStatData
                    break
                case "defense":
                    def = decodedStatData
                    break
                case "special-attack":
                    spAtk = decodedStatData
                    break
                case "special-defense":
                    spDef = decodedStatData
                    break
                case "speed":
                    speed = decodedStatData
                    break
                default:
                    break
                }
            }
        }
    }
    
    fileprivate struct Types: Hashable, Decodable {
        let type: NameLink
        let slot: Int
    }
}

extension Pokemon {
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        baseExperience = try container.decode(Int.self, forKey: .baseExperience)
        height = try container.decode(Int.self, forKey: .height)
        abilities = try container.decode([Ability].self, forKey: .abilities)
        moves = []
        var decodedType: [NameLink] = []
        stats = try container.decode(Stats.self, forKey: .stats)
        var typeContainer = try container.nestedUnkeyedContainer(forKey: .types)
        guard let size = typeContainer.count else {
            fatalError("No types?!")
        }
        for _ in 0..<size {
            let type = try typeContainer.decode(Types.self)
            decodedType.append(NameLink(name: type.type.name, url: type.type.url))
        }
        types = decodedType
    }
}

extension Pokemon.StatData {
    static func customMock(baseStat: Int, effort: Int) -> Self {
        Self(baseStat: baseStat, effort: effort, stat: Pokemon.NameLink(name: "Youngster Joey", url: "RATATA"))
    }
    static let mock: Self = Self(baseStat: -1, effort: -1, stat: Pokemon.NameLink(name: "Youngster Joey", url: "RATATA"))
}
