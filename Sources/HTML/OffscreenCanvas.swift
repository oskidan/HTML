import JavaScriptKit

public struct OffscreenCanvas {

    public let jsObject: JSObject
}

extension OffscreenCanvas: CanvasPrtocol {}

extension OffscreenCanvas {

    public init?(width: Double, height: Double) {
        guard case let .function(constructor) = JSObject.global.OffscreenCanvas else {
            return nil
        }
        self.jsObject = constructor.new(width, height) 
    }
}