import XCTest

@testable import HTML

final class QueryingHTMLElements: XCTestCase, @unchecked Sendable {

    // HTML elements can be queried by: ID.
    // Failed queries return `null`.

    // Scenario: Querying a non existing canvas by ID
    //  Given: I have a canvas ID
    //  When: The canvas does not exist
    //  And: I query a canvas by this ID
    //  Then: I get `null`
    @MainActor
    func test_querying_a_non_existing_canvas_by_id() async {
        guard let document = Document.shared else {
            XCTFail("Cannot get the document.")
            return
        }
        let canvas = document.get(Canvas.self, id: "game")
        XCTAssertNil(canvas)
    }
}
