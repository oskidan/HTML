import JavaScriptKit

public struct Canvas {
    public let jsObject: JSObject
}

extension Canvas: Element {}

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

    public var width: Double {
        get {
            guard case let .number(value) = jsObject.width else {
                return 0.0
            }
            return value
        }
        set {
            jsObject.width = newValue.jsValue
        }
    }

    public var height: Double {
        get {
            guard case let .number(value) = jsObject.height else {
                return 0.0
            }
            return value
        }
        set {
            jsObject.height = newValue.jsValue
        }
    }
}