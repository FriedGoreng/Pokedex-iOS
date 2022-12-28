import Foundation
import SwiftUI

struct Helper {
    public static func generatePokedexValue(_ value: Int) -> String{
        if (value > 99){
            return String(value)
        }
        if (value > 9) {
            return "0".appending(String(value))
        }
        return "00".appending(String(value))
    }
    
    public static func getPokemonImage(_ id: Int) -> Image {
        return Image(String(id))
    }
    
    public static func capitaliseFirst(_ value: String) -> String {
        var newString = ""
        var didFirst = false
        for ch in value  {
            if !didFirst {
                didFirst = true
                newString.append(ch.uppercased())
            } else {
                newString.append(ch)
            }
        }
        return newString
    }
}
