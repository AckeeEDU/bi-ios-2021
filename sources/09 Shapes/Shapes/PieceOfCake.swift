//
//  PieceOfCake.swift
//  Shapes
//
//  Created by Lukáš Hromadník on 24.11.2021.
//

import SwiftUI

struct PieceOfCake: Shape {
    let start: Angle
    let end: Angle

    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.midX, y: rect.midY))
            path.addArc(
                center: CGPoint(x: rect.midX, y: rect.midY),
                radius: min(rect.width, rect.height) / 2,
                startAngle: start - .degrees(90),
                endAngle: end - .degrees(90),
                clockwise: false
            )
            path.addLine(to: CGPoint(x: rect.midX, y: rect.midY))
        }
    }
}

struct PieceOfCake_Previews: PreviewProvider {
    static var previews: some View {
        PieceOfCake(
            start: Angle(degrees: 0),
            end: Angle(degrees: 110)
        )
            .fill(.red)
            .previewLayout(.fixed(width: 400, height: 400))
            .padding()
    }
}
