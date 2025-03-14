import JavaScriptKit

public struct ElementKind: Sendable {
    let type: any Element.Type
}

// extension ElementKind {
//     public init<T>(type: T.Type = T.self) where T: Element {
//         self.type = type
//     }
// }

extension ElementKind: Equatable {
    public static func ==(lhs: Self, rhs: Self) -> Bool {
        lhs.type == rhs.type
    }
}

extension ElementKind: Hashable {
    public func hash(into hasher: inout Hasher) {
        ObjectIdentifier(type).hash(into: &hasher)
    }
}

extension ElementKind {
    typealias Factory = (JSObject) -> any Element

    @MainActor
    static let factory: [String: Factory] = [
        "canvas": Canvas.init(jsObject:)
    ]
}