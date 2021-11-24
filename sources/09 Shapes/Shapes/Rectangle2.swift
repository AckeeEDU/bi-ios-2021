//
//  Rectangle2.swift
//  Shapes
//
//  Created by Lukáš Hromadník on 24.11.2021.
//

import SwiftUI

struct Rectangle2: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
        return path
    }
}

struct Rectangle2_Previews: PreviewProvider {
    static var previews: some View {
        Rectangle2()
            .stroke(
                .red,
                style: StrokeStyle(
                    lineWidth: 3,
                    lineCap: .round,
                    lineJoin: .bevel,
                    miterLimit: 0,
                    dash: [10, 7, 1, 7],
                    dashPhase: 0
                )
            )
            .previewLayout(.fixed(width: 100, height: 200))
            .padding()
    }
}
