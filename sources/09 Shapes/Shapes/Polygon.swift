//
//  Polygon.swift
//  Shapes
//
//  Created by Lukáš Hromadník on 24.11.2021.
//

import SwiftUI

struct Polygon: Shape {
    let n: Int

    func path(in rect: CGRect) -> Path {
        let radius = min(rect.size.width, rect.size.height) / 2
        var path = Path()

        let points = (0..<n).map { i -> CGPoint in
            let angle = Angle(degrees: 360 / Double(n) * Double(i) - 90)
            let x = cos(angle.radians) * radius + rect.midX
            let y = sin(angle.radians) * radius + rect.midY
            return CGPoint(x: x, y: y)
        }
        path.move(to: points[0])
        path.addLines(points)
        path.addLine(to: points.first!)

        return path
    }
}

struct Polygon_Previews: PreviewProvider {
    static var previews: some View {
        Polygon(n: 5)
            .stroke(.orange)
            .previewLayout(.fixed(width: 400, height: 400))
            .padding()
    }
}
