public enum PokemonTypes: Equatable, CaseIterable {
    case normal
    case fire
    case water
    case electric
    case grass
    case ice
    case fighting
    case poison
    case ground
    case flying
    case psychic
    case bug
    case rock
    case ghost
    case dragon
    case dark
    case steel
    case fairy
}


/** Single Type Comparions **/
public extension PokemonTypes {
    func isWeakTo(_ type: Self) -> Bool {
        switch self {
        case .normal:
            return checkList(type, .fighting)
        case .fire:
            return checkList(type, .ground, .rock, .water)
        case .water:
            return checkList(type, .electric, .grass)
        case .electric:
            return checkList(type, .ground)
        case .grass:
            return checkList(type, .flying, .poison, .bug, .fire, .ice)
        case .ice:
            return checkList(type, .fighting, .rock, .steel, .fire)
        case .fighting:
            return checkList(type, .flying, .psychic, .fairy)
        case .poison:
            return checkList(type, .ground, .psychic)
        case .ground:
            return checkList(type, .water, .grass, .ice)
        case .flying:
            return checkList(type, .rock, .electric, .ice)
        case .psychic:
            return checkList(type, .bug, .ghost, .dark)
        case .bug:
            return checkList(type, .flying, .rock, .fire)
        case .rock:
            return checkList(type, .fighting, .ground, .steel, .water, .grass)
        case .ghost:
            return checkList(type, .ghost, .dark)
        case .dragon:
            return checkList(type, .dragon, .ice, .fairy)
        case .dark:
            return checkList(type, .fighting, .bug, .fairy)
        case .steel:
            return checkList(type, .fighting, .ground, .fire)
        case .fairy:
            return checkList(type, .poison, .steel)
        }
    }
    
    func isResistantTo(_ type: Self) -> Bool {
        switch self {
        case .normal:
            return false
        case .fire:
            return checkList(type, .bug, .steel, .fire, .grass, .ice, .fairy)
        case .water:
            return checkList(type, .steel, .fire, .water, .ice)
        case .electric:
            return checkList(type, .flying, .steel, .electric)
        case .grass:
            return checkList(type, .ground, .water, .grass, .electric)
        case .ice:
            return checkList(type, .ice)
        case .fighting:
            return checkList(type, .rock, .bug, .dark)
        case .poison:
            return checkList(type, .fighting, .poison, .bug, .grass, .fairy)
        case .ground:
            return checkList(type, .poison, .rock)
        case .flying:
            return checkList(type, .fighting, .bug, .grass)
        case .psychic:
            return checkList(type, .fighting, .psychic)
        case .bug:
            return checkList(type, .fighting, .ground, .grass)
        case .rock:
            return checkList(type, .normal, .flying, .poison, .fire)
        case .ghost:
            return checkList(type, .poison, .bug)
        case .dragon:
            return checkList(type, .fire, .grass, .water, .electric)
        case .dark:
            return checkList(type, .ghost, .dark)
        case .steel:
            return checkList(type, .normal, .flying, .rock, .bug, .steel, .grass, .psychic, .ice
                             , .dragon, .fairy)
        case .fairy:
            return checkList(type, .fighting, .bug, .dark)
        }
    }
    
    func isImmuneTo(_ type: Self) -> Bool {
        switch self {
        case .normal:
            return checkList(type, .ghost)
        case .fire:
            return false
        case .water:
            return false
        case .electric:
            return false
        case .grass:
            return false
        case .ice:
            return false
        case .fighting:
            return false
        case .poison:
            return false
        case .ground:
            return checkList(type, .electric)
        case .flying:
            return checkList(type, .ground)
        case .psychic:
            return false
        case .bug:
            return false
        case .rock:
            return false
        case .ghost:
            return checkList(type, .normal, .fighting)
        case .dragon:
            return false
        case .dark:
            return checkList(type, .psychic)
        case .steel:
            return checkList(type, .poison)
        case .fairy:
            return checkList(type, .dragon)
        }
    }
    
    private func checkList(_ chosen: Self, _ list: Self...) -> Bool{
        return list.reduce(false) { $0 || ($1 == chosen) }
    }
}

/** Dual Type Comparions **/
public extension PokemonTypes {
    enum Damage {
        case quad
        case double
        case single
        case half
        case quarter
    }
    struct DamageModifer {
        let type: PokemonTypes
        let modifier: Damage
    }
}
