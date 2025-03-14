import XCTest
import JavaScriptKit
@testable import HTML

final class DocumentTests: XCTestCase {

    func test_shared_document_is_not_nil() {
        XCTAssertNotNil(Document.shared)
    }

    func test_it_can_create_a_canvas() {
        let jsValue = Document.shared!.createElement("canvas")
        guard case .object = jsValue else {
            XCTFail("Could not create a canvas.")
            return
        }
    }
}