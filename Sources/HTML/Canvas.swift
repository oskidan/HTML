import JavaScriptKit

public struct Canvas {
    public let jsObject: JSObject
}

extension Canvas: Element {}

extension Canvas {
    init?(width: Int, height: Int) {
        guard let document = Document.shared else {
            return nil
        }
        guard case let .object(jsObject) = document.createElement("canvas") else {
            return nil
        }
        self.jsObject = jsObject
    }
}