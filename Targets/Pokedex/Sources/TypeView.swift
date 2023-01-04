import PokemonTypes
import SwiftUI

struct TypeView: View {
    let type: PokemonTypes
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(getColour)
                .frame(width: 100, height: 50)
            Text(Helper.capitaliseFirst(type.rawValue)).foregroundColor(.white)
        }
    }
    
    fileprivate var getColour: Color {
        switch type {
        case .normal:
            return .gray
        case .fire:
            return .red
        case .water:
            return .blue
        case .electric:
            return .yellow
        case .grass:
            return .green
        case .ice:
            return .mint
        case .fighting:
            return .orange
        case .poison:
            return .purple
        case .ground:
            return .brown
        case .flying:
            return .teal
        case .psychic:
            return .pink
        case .bug:
            return .green
        case .rock:
            return .brown
        case .ghost:
            return .purple
        case .dragon:
            return .blue
        case .dark:
            return .black
        case .steel:
            return .gray
        case .fairy:
            return .pink
        }
    }
}

struct TypeView_Previews: PreviewProvider {
    static var previews: some View {
        TypeView(type: .bug)
    }
}
