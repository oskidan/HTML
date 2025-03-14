import XCTest
@testable import HTML

final class Simple2DRendering: XCTestCase {

    // CanvasRenderingContext2D can be used for simple 2D rendering.
    // To get the context, one must call `getContext`.

    // Scenario: Getting the rendering context.
    //  Given: I have a canvas
    //  When: I get its 2D rendering context
    //  Then: The context is not null
    func test_getting_teh_rendering_context() {
        guard let canvas = Canvas(width: 320, height: 240) else {
            XCTFail("Cannot create a canvas.")
            return
        }
        XCTAssertNotNil(canvas.context2D)
    }
}