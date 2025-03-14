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

    /// There can be only one body element in a document.
    public var body: Body? {
        guard case let .object(jsObject) = jsObject.body else {
            return nil
        }
        return .init(jsObject: jsObject)
    }

    func createElement(_ name: String) -> JSObject? {
        guard let createElement: JSMethod = jsObject.createElement else {
            return nil
        }
        guard case let .object(jsObject) = createElement(name.jsValue) else {
            return nil
        }
        return jsObject
    }

    func getElementById(_ id: String) -> JSObject? {
        guard let getElementById: JSMethod = jsObject.getElementById else {
            return nil
        }
        guard case let .object(jsObject) = getElementById(id.jsValue) else {
            return nil
        }
        return jsObject
    }

    @MainActor
    public func get<T>(_ type: T.Type, id: String) -> T? where T: Element {
        guard let jsObject = getElementById(id) else {
            return nil
        }
        guard case let .string(localName) = jsObject.localName else {
            return nil
        }
        guard let factory = ElementKind.factory[String(localName)] else {
            return nil
        }
        return factory(jsObject) as? T
    }
}
