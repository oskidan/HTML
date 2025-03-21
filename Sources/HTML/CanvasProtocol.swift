import JavaScriptKit

/// Types conforming to this protocol represent graphics canvases.
public protocol CanvasPrtocol {

    var jsObject: JSObject { get }

    var width: Double { get }

    var height: Double { get }

    var context2D: RenderingContext2D? { get }
}

extension CanvasPrtocol {

    public var context2D: RenderingContext2D? {
        guard case let .function(getContext) = jsObject.getContext else {
            return nil
        }
        guard case let .object(jsObject) = getContext(this: jsObject, "2d".jsValue) else {
            return nil
        }
        return .init(jsObject: jsObject)
    }

    public var width: Double {
        get {
            guard case let .number(value) = jsObject.width else {
                return 0.0
            }
            return value
        }
        set {
            jsObject.width = newValue.jsValue
        }
    }

    public var height: Double {
        get {
            guard case let .number(value) = jsObject.height else {
                return 0.0
            }
            return value
        }
        set {
            jsObject.height = newValue.jsValue
        }
    }
}