import JavaScriptKit

extension Canvas {
    public struct Context2D {
        let jsObject: JSObject
    }

    public var context2D: Context2D? {
        guard let getContext: JSMethod = jsObject.getContext else {
            return nil
        }
        guard case let .object(jsObject) = getContext("2d".jsValue) else {
            return nil
        }
        return .init(jsObject: jsObject)
    }
}

extension Canvas.Context2D: ConvertibleToJSValue {
    public var jsValue: JSValue {
        .object(jsObject)
    }
}

extension Canvas.Context2D {
    public func fillRect(x: Double, y: Double, width: Double, height: Double) {
        guard let fillRect: JSMethod = jsObject.fillRect else {
            fatalError("The rendering conext has no method called 'fillRect'.")
        }
        _ = fillRect(x, y, width, height)
    }
}