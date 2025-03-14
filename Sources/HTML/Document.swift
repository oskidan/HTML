import JavaScriptKit

public struct Document {
    public let jsObject: JSObject
}

extension Document: Node {}

extension Document {
    public static var shared: Document? {
        guard case let .object(jsObject) = JSObject.global.document else {
            return nil
        }
        return .init(jsObject: jsObject)
    }

    func createElement(_ name: String) -> JSValue {
        guard let createElement: JSMethod = jsObject.createElement else {
            return .undefined
        }
        return createElement(name.jsValue)
    }
}
