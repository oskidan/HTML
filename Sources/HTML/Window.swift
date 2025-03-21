import Foundation
import JavaScriptKit

public struct Window {
    let jsObject: JSObject
}

extension Window {
    public static var shared: Window? {
        guard case let .object(jsObject) = JSObject.global.window else {
            return nil
        }
        return .init(jsObject: jsObject)
    }

    // Requires JavaScriptEventLoop to run. JavaScriptEventLoop is available on:
    @available(macOS 14.0, iOS 17.0, watchOS 10.0, tvOS 17.0, *)
    @MainActor
    public func requestAnimationFrame() async {
        guard case let .function(requestAnimationFrame) = jsObject.requestAnimationFrame else {
            return
        }
        return await withUnsafeContinuation { continuation in
            _ = requestAnimationFrame(
                JSClosure { _ in
                    continuation.resume(returning: ())
                    return .undefined
                }
            )
        }
    }
}

extension Window: ConvertibleToJSValue {
    public var jsValue: JSValue {
        .object(jsObject)
    }
}
