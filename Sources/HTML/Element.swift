public protocol Element: Node {
    var kind: ElementKind { get }
}

extension Element {
    public var kind: ElementKind { .init(type: Self.self) }
}

