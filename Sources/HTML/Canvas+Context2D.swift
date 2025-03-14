import JavaScriptKit

extension Canvas {
    struct Context2D {
        let jsObject: JSObject
    }

    var context2D: Context2D? {
        guard let getContext: JSMethod = jsObject.getContext else {
            return nil
        }
        guard case let .object(jsObject) = getContext("2d".jsValue) else {
            return nil
        }
        return .init(jsObject: jsObject)
    }
}
