import JavaScriptKit

public protocol Node {
    var jsObject: JSObject { get }
}

extension ConvertibleToJSValue where Self: Node {
    var jsValue: JSValue {
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
}
