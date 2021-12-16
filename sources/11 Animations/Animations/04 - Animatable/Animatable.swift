//
//  Animatable.swift
//  Animations
//
//  Created by Igor Rosocha on 12/08/21.
//

import SwiftUI

struct Animatable: View {
    @State private var percentage: CGFloat = 0

    var body: some View {
        VStack(spacing: 60) {
            LoadingIndicator(percentage: percentage)
            Button("Load") {
                withAnimation(.easeInOut(duration: 5.0)) { self.percentage = 1.0 }
            }.font(.headline)
        }
    }
}

struct Animatable_Previews: PreviewProvider {
    static var previews: some View {
        Animatable()
    }
}

// MARK: - Custom shapes

struct ArcShape: Shape {
    let percentage: CGFloat
    
    func path(in rect: CGRect) -> Path {

        var path = Path()

        path.addArc(center: CGPoint(x: rect.width / 2.0, y: rect.height / 2.0),
                 radius: rect.height / 2.0 + 5.0,
                 startAngle: .degrees(0),
                 endAngle: .degrees(360.0 * Double(percentage)),
                 clockwise: false
        )

        return path.strokedPath(.init(lineWidth: 10, dash: [6, 3]))
    }
}

// MARK: - Custom views

struct LabelView: View {
    let percentage: CGFloat
    
    var body: some View {
        Text("\(Int(percentage * 100)) %")
            .font(.largeTitle)
            .fontWeight(.bold)
            .foregroundColor(.white)
    }
}

struct LoadingIndicator: View {
    var percentage: CGFloat
    
    var body: some View {
        return Circle()
            .fill(
                LinearGradient(
                    gradient: Gradient(colors: [.purple, .blue]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing)
            )
            .frame(width: 150, height: 150)
             .modifier(PercentageIndicator(percentage: percentage))
    }
}

// MARK: - Custom view modifiers

struct PercentageIndicator: AnimatableModifier {
    var percentage: CGFloat = 0
    
     var animatableData: CGFloat {
         get { percentage }
         set { percentage = newValue }
     }
    
    func body(content: Content) -> some View {
        content
            .overlay(ArcShape(percentage: percentage).foregroundColor(.red))
            .overlay(LabelView(percentage: percentage))
    }
}
