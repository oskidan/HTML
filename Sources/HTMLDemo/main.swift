import CSS
import HTML
import JavaScriptEventLoop

JavaScriptEventLoop.installGlobalExecutor()

guard let body = Document.shared?.body else {
    fatalError("Woops, the document has no body.")
}

guard let canvas = Canvas(width: 320, height: 240) else {
    fatalError("Whoops, cannot create a canvas.")
}
body.append(child: canvas)

guard var context2D = canvas.context2D else {
    fatalError("Whoops, cannot get the 2D conext.")
}

for i in 0... {
    await Window.shared?.requestAnimationFrame()
    // Draw a checker board pattern.
    let cellSize = 16.0
    for x in 0..<Int(canvas.width / cellSize) {
        for y in 0..<Int(canvas.height / cellSize) {
            if (x + i) % 2 != y % 2 {
                switch (x + y + i) % 7 {
                case 0:
                    context2D.fillStyle = .red
                case 1:
                    context2D.fillStyle = .orange
                case 2:
                    context2D.fillStyle = .yellow
                case 3:
                    context2D.fillStyle = .green
                case 4:
                    context2D.fillStyle = .lightblue
                case 5:
                    context2D.fillStyle = .blue
                default:
                    context2D.fillStyle = .violet
                }
                context2D.fillRect(
                    x: Double(x) * cellSize,
                    y: Double(y) * cellSize,
                    width: cellSize,
                    height: cellSize
                )
            }
        }
    }
}
