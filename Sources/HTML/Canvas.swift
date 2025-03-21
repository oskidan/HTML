import JavaScriptKit

public struct Canvas {

    public let jsObject: JSObject
}

extension Canvas: Element {}

extension Canvas: CanvasPrtocol {}

extension Canvas {

    public init?() {
        guard let document = Document.shared else {
            return nil
        }
        guard let jsObject = document.createElement("canvas") else {
            return nil
        }
        self.jsObject = jsObject
    }

    public init?(width: Double, height: Double) {
        guard let canvas = Canvas() else {
            return nil
        }
        self = canvas
        self.width = width
        self.height = height
    }
}