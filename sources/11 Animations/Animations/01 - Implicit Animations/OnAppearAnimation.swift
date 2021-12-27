//
//  OnAppearAnimation.swift
//  Animations
//
//  Created by Igor Rosocha on 12/08/21.
//

import SwiftUI

struct OnAppearAnimation: View {
    @State private var animationAmount = 1.0
    
    var body: some View {
        Button("❤️") {
            animationAmount += 1
        }
        .font(.system(size: 100))
        .scaleEffect(animationAmount)
        .overlay(
            Circle()
                .fill()
                .frame(width: 180, height: 180)
                .foregroundColor(.red.opacity(0.5))
                .scaleEffect(animationAmount)
                .opacity(2 - animationAmount)
        )
        .animation(
            .easeOut(duration: 0.5)
                .repeatForever(autoreverses: false),
            value: animationAmount
        )
        .onAppear {
            animationAmount = 2
        }
    }
}

struct OnAppearAnimation_Previews: PreviewProvider {
    static var previews: some View {
        OnAppearAnimation()
    }
}
