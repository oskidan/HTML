import JavaScriptKit

public enum CompositeOperation: String {

    // This is the default setting and draws new shapes on top of the existing canvas content.
    case sourceOver = "source-over"

    // The new shape is drawn only where both the new shape and the destination canvas overlap.
    // Everything else is made transparent.
    case sourceIn = "source-in"

    // The new shape is drawn where it doesn't overlap the existing canvas content.
    case sourceOut = "source-out"

    // The new shape is only drawn where it overlaps the existing canvas content.
    case sourceAtop = "source-atop"

    // New shapes are drawn behind the existing canvas content.
    case destinationOver = "destination-over"

    // The existing canvas content is kept where both the new shape and existing canvas content overlap.
    // Everything else is made transparent.
    case destinationIn = "destination-in"

    // The existing content is kept where it doesn't overlap the new shape.
    case destinationOut = "destination-out"

    // The existing canvas is only kept where it overlaps the new shape. 
    // The new shape is drawn behind the canvas content.
    case destinationAtop = "destination-atop"

    // Where both shapes overlap, the color is determined by adding color values.
    case lighter = "lighter"

    // Only the new shape is shown.
    case copy = "copy"

    // Shapes are made transparent where both overlap and drawn normal everywhere else.
    case xor = "xor"

    // The pixels of the top layer are multiplied with the corresponding pixels of the bottom layer.
    // A darker picture is the result.
    case multiply = "multiply"

    // The pixels are inverted, multiplied, and inverted again. A lighter picture is the result (opposite of multiply).
    case screen = "screen"

    // A combination of multiply and screen. Dark parts on the base layer become darker, and light parts become lighter.
    case overlay = "overlay"

    // Retains the darkest pixels of both layers.
    case darken = "darken"

    // Retains the lightest pixels of both layers.
    case lighten = "lighten"

    // Divides the bottom layer by the inverted top layer.
    case colorDodge = "color-dodge"

    // Divides the inverted bottom layer by the top layer, and then inverts the result.
    case colorBurn = "color-burn"

    // Like overlay, a combination of multiply and screen — but instead with the top layer and bottom layer swapped.
    case hardLight = "hard-light"

    // A softer version of hard-light. Pure black or white does not result in pure black or white.
    case softLight = "soft-light"

    // Subtracts the bottom layer from the top layer — or the other way round — to always get a positive value.
    case difference = "difference"

    // Like difference, but with lower contrast.
    case exclusion = "exclusion"

    // Preserves the luma and chroma of the bottom layer, while adopting the hue of the top layer.
    case hue = "hue"

    // Preserves the luma and hue of the bottom layer, while adopting the chroma of the top layer.
    case saturation = "saturation"

    // Preserves the luma of the bottom layer, while adopting the hue and chroma of the top layer.
    case color = "color"

    // Preserves the hue and chroma of the bottom layer, while adopting the luma of the top layer.
    case luminosity = "luminosity"
}

extension CompositeOperation: ConvertibleToJSValue {

    public var jsValue: JSValue {
        .string(rawValue)
    }
}