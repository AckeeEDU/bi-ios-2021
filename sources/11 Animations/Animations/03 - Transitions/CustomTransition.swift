//
//  CustomTransition.swift
//  Animations
//
//  Created by Igor Rosocha on 12/08/21.
//

import SwiftUI

struct CustomTransition: View {
    @State private var heartDisplayed = false
    
    var body: some View {
        VStack {
            Button("I love SwiftUI!") {
                withAnimation {
                    heartDisplayed.toggle()
                }
            }
            if heartDisplayed {
                Button("❤️") {
                }
                .font(.system(size: 200))
                .transition(.pivot)
            }
        }
    }
}

struct CustomTransition_Previews: PreviewProvider {
    static var previews: some View {
        CustomTransition()
    }
}

// MARK: - Custom view modifiers

struct OpacityModifier: ViewModifier {
    let opacity: Double

    func body(content: Content) -> some View {
        content.opacity(opacity)
    }
}

struct CornerRotateModifier: ViewModifier {
    let amount: Double
    let anchor: UnitPoint

    func body(content: Content) -> some View {
        content
            .rotationEffect(.degrees(amount), anchor: anchor)
            .clipped()
    }
}

// MARK: - Custom transitions

extension AnyTransition {
    static var opacity: AnyTransition {
        .modifier(
            active: OpacityModifier(opacity: 0),
            identity: OpacityModifier(opacity: 1)
        )
    }

    static var pivot: AnyTransition {
        .modifier(
            active: CornerRotateModifier(amount: -90, anchor: .topLeading),
            identity: CornerRotateModifier(amount: 0, anchor: .topLeading)
        )
    }
}
