import XCTest
@testable import BitcoinAPI

final class BitcoinAPITests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(BitcoinAPI().text, "Hello, World!")
    }
}
