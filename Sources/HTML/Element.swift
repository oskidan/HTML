import JavaScriptKit

public protocol Element: Node {
    var kind: ElementKind { get }
}

extension Element {
    public var kind: ElementKind { .init(type: Self.self) }

    public var id: String? {
        get {
            guard case let .string(id ) = jsObject.id else {
                return nil
            }
            return String(id)
        }
        set {
            jsObject.id = newValue.jsValue
        }
    }
}
