//
//  BindingAnimation.swift
//  Animations
//
//  Created by Igor Rosocha on 12/08/21.
//

import SwiftUI

struct BindingAnimation: View {
    @State private var animationAmount = 1.0
    
    var body: some View {
        VStack(alignment: .center, spacing: 200) {
            Button("🍔") { }
            .font(.system(size: 100))
            .scaleEffect(animationAmount)
            Stepper(
                "Scale amount",
                value: $animationAmount.animation(
                    .easeInOut(duration: 0.5)
                        .repeatCount(3, autoreverses: true)
                ), in: 1...10)
                .padding(.leading, 20)
                .padding(.trailing, 20)
        }
    }
}

struct BindingAnimation_Previews: PreviewProvider {
    static var previews: some View {
        BindingAnimation()
    }
}
