import XCTest
@testable import PokemonTypes

final class PokemonTypesTests: XCTestCase {
    func test_rockResistsNormal() {
        let chosenType = PokemonTypes.rock
        XCTAssertTrue(chosenType.isResistantTo(.normal))
    }
    
    func test_waterWeakToElectric() {
        let chosenType = PokemonTypes.water
        XCTAssertTrue(chosenType.isWeakTo(.electric))
    }
    
    func test_ghostImmuneToFighting() {
        let chosenType = PokemonTypes.ghost
        XCTAssertTrue(chosenType.isImmuneTo(.fighting))
    }
}
