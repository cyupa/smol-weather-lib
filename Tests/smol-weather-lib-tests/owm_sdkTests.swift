import XCTest
@testable import owm_sdk

final class owm_sdkTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(owm_sdk().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
