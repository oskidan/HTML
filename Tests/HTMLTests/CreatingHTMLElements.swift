import XCTest

@testable import HTML

final class CreatingHTMLElements: XCTestCase, @unchecked Sendable {

    // HTML elements can be created at run time.
    // New elements must be appended to elements in the DOM.

    // Scenario: Adding a new canvas to the body
    //  Given: I have a canvas ID
    //  When: I create the canvas
    //  And: I add it to the HTML body
    //  Then: I can get the canvas by its ID
    @MainActor
    func test_adding_a_new_canvas_to_the_body() async {
        guard var canvas = Canvas(width: 320, height: 240) else {
            XCTFail("Cannot create a canvas.")
            return
        }
        canvas.id = "game"
        guard let body = Document.shared?.body else {
            XCTFail("Cannot get the document body.")
            return
        }
        body.append(child: canvas)
        defer {
            // Cleanup.
            body.remove(child: canvas)
        }
        XCTAssertEqual(canvas, Document.shared?.get(Canvas.self, id: "game"))
    }
}
