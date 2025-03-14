import XCTest
@testable import HTML

final class CanvasTests: XCTestCase {

    func test_it_can_be_created() {
        XCTAssertNotNil(Canvas())
    }

    func test_it_can_be_created_with_width_and_height() {
        let canvas = Canvas(width: 320, height: 240)
        XCTAssertNotNil(canvas)
        XCTAssertEqual(canvas?.width, 320)
        XCTAssertEqual(canvas?.height, 240)
    }

    func test_once_created_its_width_is_not_0() {
        XCTAssertNotEqual(Canvas()?.width, 0)
    }
    
    func test_once_created_its_height_is_not_0() {
        XCTAssertNotEqual(Canvas()?.height, 0)
    }
}