import XCTest
@testable import HTML

final class CanvasTests: XCTestCase {

    func test_it_is_created_with_a_width_and_a_height() {
        XCTAssertNotNil(Canvas())
    }

    func test_once_created_its_width_is_not_0() {
        XCTAssertNotEqual(Canvas()?.width, 0)
    }
    
    func test_once_created_its_height_is_not_0() {
        XCTAssertNotEqual(Canvas()?.height, 0)
    }
}