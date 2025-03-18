import XCTest
@testable import HTML

final class Animating: XCTestCase {

    // The requestAnimationFrame tells the browser you wish to perform an animation.
    // This function is available on Window interface that represents a window containing the document.

    // Scenario: Requesting a farme of animation.
    //  Given: I have a window
    //  When: I request an animation frame
    //  Then: I wait for some time
    func test_requesting_a_frame_of_animation() async {
        await Window.shared?.requestAnimationFrame()
        let then = Date.now
        await Window.shared?.requestAnimationFrame()
        let now = Date.now
        // According to MDN:
        //  > The frequency of calls to the callback function will generally match the display refresh rate. 
        //  > The most common refresh rate is 60hz, (60 cycles/frames per second), though 75hz, 120hz, and 
        //  > 144hz are also widely used.
        // Let's cap at 1000hz and hope that this refresh rate is a long way from now.
        XCTAssertGreaterThanOrEqual(now.timeIntervalSince(then), 1.0 / 1000.0)
    }
}