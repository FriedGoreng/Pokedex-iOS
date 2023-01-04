//
//  Navigationitem.swift
//  Pokedex
//
//  Created by Joshua Lembong on 20/12/2022.
//

import SwiftUI

struct NavigationItem: View {
    let id: Int
    let name: String
    
    init(_ id: Int, _ name: String) {
        self.id = id
        self.name = name
    }
    var body: some View {
        HStack{
            HStack {
                Helper.getPokemonImage(id)
                Text(Helper.generatePokedexValue(id)).font(.body)
            }
            Spacer()
            Text(name).font(.body)
        }.padding()
    }
}

struct NavigationItem_Previews: PreviewProvider {
    static var previews: some View {
        NavigationItem(1, "Bulbasaur")
    }
}
