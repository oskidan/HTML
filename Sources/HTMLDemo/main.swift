import HTML

guard let body = Document.shared?.body else {
    fatalError("Woops, the document has no body.")
}

guard let canvas = Canvas(width: 320, height: 240) else {
    fatalError("Whoops, cannot create a canvas.")
}
body.append(child: canvas)

guard let context2D = canvas.context2D else {
    fatalError("Whoops, cannot get the 2D conext.")
}

// Draw a checker board pattern.
let cellSize = 16.0
for x in 0..<Int(canvas.width / cellSize) {
    for y in 0..<Int(canvas.height / cellSize) {
        if x % 2 != y % 2 {
            context2D.fillRect(
                x: Double(x) * cellSize, 
                y: Double(y) * cellSize, 
                width: cellSize, 
                height: cellSize
            )
        }
    }
}
