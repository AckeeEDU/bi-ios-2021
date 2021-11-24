//
//  Logo.swift
//  FITstagram
//
//  Created by Lukáš Hromadník on 17.11.2021.
//

import SwiftUI

let coneColor = Color(red: 208 / 255, green: 190 / 255, blue: 157 / 255)

struct HalfCircle: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.addArc(
                center: CGPoint(x: rect.midX, y: rect.maxY),
                radius: min(rect.width, rect.height),
                startAngle: .degrees(0),
                endAngle: .degrees(180),
                clockwise: true
            )
        }
    }
}

struct Cone: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.minX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
        }
    }
}

struct IceCreamView: View {
    var body: some View {
        GeometryReader { proxy in
            ZStack(alignment: .topLeading) {
                Circle()
                    .fill(.cyan)
                    .frame(width: proxy.size.width / 2, height: proxy.size.width / 2)
                    .offset(x: proxy.size.width / 4)

                HalfCircle()
                    .fill(.red)
                    .frame(width: proxy.size.width / 2, height: proxy.size.width / 4)
                    .offset(y: proxy.size.width / 8)



                HalfCircle()
                    .fill(.purple)
                    .frame(width: proxy.size.width / 2, height: proxy.size.width / 4)
                    .offset(
                        x: proxy.size.width / 2,
                        y: proxy.size.width / 8
                    )

                Cone()
//                    .fill(coneColor)
                    .fill(
                        LinearGradient(
                            colors: [.orange, .green],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(
                        width: proxy.size.width,
                        height: proxy.size.height - proxy.size.width / 8 * 3
                    )
                    .offset(y: proxy.size.width / 8 * 3)
            }

        }
    }
}

struct IceCreamView_Previews: PreviewProvider {
    static var previews: some View {
        IceCreamView()
            .previewLayout(.fixed(width: 500, height: 750))
            .padding()
    }
}
