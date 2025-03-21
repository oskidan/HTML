import CSS
import JavaScriptKit

/// A 2D rendering context for graphics canvases.
public struct RenderingContext2D {

    let jsObject: JSObject
}

extension RenderingContext2D: ConvertibleToJSValue {

    public var jsValue: JSValue {
        .object(jsObject)
    }
}

extension RenderingContext2D {

    public var compositeOperation: CompositeOperation {
        get {
            guard case let .string(operation) = jsObject.globalCompositeOperation else {
                return .sourceOver
            }
            return .init(rawValue: operation.description) ?? .sourceOver
        }
        nonmutating set {
            jsObject.globalCompositeOperation = newValue.jsValue
        }
    }

    // FIXME: According to https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D/fillStyle
    // `fillStyle` is one of the following:
    //      - a color;
    //      - a linear or a radial gradient;
    //      - a repeating image.
    // For the time being, only a color (specifically, a hexadecimal color) is supported.
    public var fillStyle: HEXColor {
        get {
            guard case let .string(fillStyle) = jsObject.fillStyle else {
                return "#000"
            }
            return HEXColor(String(fillStyle)) ?? "#000"
        }
        nonmutating set {
            jsObject.fillStyle = newValue.jsValue
        }
    }

    public func clearRect(x: Double, y: Double, width: Double, height: Double) {
        guard case let .function(clearRect) = jsObject.clearRect else {
            fatalError("The rendering conext has no method called 'clearRect'.")
        }
        _ = clearRect(this: jsObject, x, y, width, height)
    }

    public func fillRect(x: Double, y: Double, width: Double, height: Double) {
        guard case let .function(fillRect) = jsObject.fillRect else {
            fatalError("The rendering conext has no method called 'fillRect'.")
        }
        _ = fillRect(this: jsObject, x, y, width, height)
    }

    public func drawImage(_ canvas: any CanvasPrtocol, x: Double, y: Double) {
        guard case let .function(drawImage) = jsObject.drawImage else {
            fatalError("The rendering conext has no method called 'drawImage'.")
        }
        _ = drawImage(this: jsObject, canvas.jsObject, x, y)
    }
}
