# PokemonTypes

Gives you a type enum that you can use through `PokemonTypes.{CHOSEN_TYPE}`.
Each type case comes with a few helper methods to discern type comparions. 

 - `isWeakTo(_) -> Bool` where the parameter is the comparion type
 - `isResistantTo(_) -> Bool` where the parameter is the comparion type
 - `isImmuneTo(_) -> Bool` where the parameter is the comparion type
 
```
import PokemonTypes
let chosenType = PokemonTypes.Ghost
chosenType.isWeakTo(.fire) //returns false
chosenType.isImmuneTo(.fighting) //returns true
chosenType.isResistantTo(.dark) //returns false
```
