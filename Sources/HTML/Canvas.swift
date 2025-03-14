import JavaScriptKit

public struct Canvas {
    public let jsObject: JSObject
}

extension Canvas: Element {}

extension Canvas {
    init?() {
        guard let document = Document.shared else {
            return nil
        }
        guard case let .object(jsObject) = document.createElement("canvas") else {
            return nil
        }
        self.jsObject = jsObject
    }

    init?(width: Double, height: Double) {
        guard let canvas = Canvas() else {
            return nil
        }
        self = canvas
        self.width = width
        self.height = height
    }

    var width: Double {
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

    var height: Double {
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