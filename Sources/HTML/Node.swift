import JavaScriptKit

public protocol Node: Equatable, ConvertibleToJSValue {
    var jsObject: JSObject { get }
}

extension ConvertibleToJSValue where Self: Node {
    public var jsValue: JSValue {
        .object(jsObject)
    }
}

extension Node {
    func append<Child>(child: Child) where Child: Node & ConvertibleToJSValue {
        guard let appendChild: JSMethod = jsObject.appendChild else {
            fatalError("The node has no method called 'appendChild'.")
        }
        _ = appendChild(child.jsValue)
    }

    func remove<Child>(child: Child) where Child: Node & ConvertibleToJSValue {
        guard let removeChild: JSMethod = jsObject.removeChild else {
            fatalError("The node has no method called 'removeChild'.")
        }
        _ = removeChild(child.jsValue)
    }
}
