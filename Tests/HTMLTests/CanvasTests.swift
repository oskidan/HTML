import XCTest
@testable import HTML

final class CanvasTests: XCTestCase {

    func test_it_is_created_with_a_width_and_a_height() {
        XCTAssertNotNil(Canvas(width: 320, height: 240))
    }
}