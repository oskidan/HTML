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
    public func append<Child>(child: Child) where Child: Node & ConvertibleToJSValue {
        guard case let .function(appendChild) = jsObject.appendChild else {
            fatalError("The node has no method called 'appendChild'.")
        }
        _ = appendChild(this: jsObject, child.jsValue)
    }

    public func remove<Child>(child: Child) where Child: Node & ConvertibleToJSValue {
        guard case let .function(removeChild) = jsObject.removeChild else {
            fatalError("The node has no method called 'removeChild'.")
        }
        _ = removeChild(this: jsObject, child.jsValue)
    }
}
