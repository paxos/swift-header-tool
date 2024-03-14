@testable import SwiftHeader
import XCTest

final class SwiftHeaderTests: XCTestCase {
    func testExample() throws {
        let input = CommentStripper.stripHeader(input: Fixtures.input1)!
        XCTAssertEqual(Fixtures.output1, input)
    }
}
