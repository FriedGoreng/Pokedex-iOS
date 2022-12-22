import XCTest
@testable import Loadable

final class LoadableTests: XCTestCase {
    
    func test_createLoadable_assignsLoadingCase() {
        let load = Loadable<String, String>()
        XCTAssertEqual(load, .loading)
    }
    
    func test_assigningLoadableState_returnsLoaded() {
        let someValue: String = "We got state!"
        var load = Loadable<String, NSError>()
        
        load.setLoadedState(someValue)
        let expectedValue: Loadable<String, NSError> = .loaded(someValue)
        
        XCTAssertEqual(load, expectedValue)
    }
    
    func test_assigningErrorState_returnsError() {
        let someError = NSError(domain: "Team Rocket has Emerged", code: 5)
        var load = Loadable<String, NSError>()
        
        load.setErrorState(someError)
        let expectedValue: Loadable<String, NSError> = .error(someError)
        
        XCTAssertEqual(load, expectedValue)
    }
}
