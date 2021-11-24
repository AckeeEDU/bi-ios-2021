//
//  ContentView.swift
//  Shapes
//
//  Created by Lukáš Hromadník on 21.11.2021.
//

import SwiftUI

struct ContentView: View {
    var values: [[CGFloat]] = (0..<7).map { _ in
        (0..<3).map { _ in CGFloat.random(in: 0...1) }
    }

    var body: some View {
        GeometryReader { proxy in
            HStack(alignment: .bottom, spacing: 7) {
                ForEach(0..<values.count) { day in
                    HStack(alignment: .bottom, spacing: 1) {
                        ForEach(0..<values[0].count) { i in
                            Rectangle()
                                .fill(.red)
                                .frame(height: proxy.size.height * values[day][i])
                        }
                    }
                }
            }
            .frame(height: proxy.size.height)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewLayout(.fixed(width: 400, height: 200))
            .padding()
    }
}
