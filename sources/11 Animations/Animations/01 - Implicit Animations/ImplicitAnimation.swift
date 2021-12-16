//
//  ImplicitAnimation.swift
//  Animations
//
//  Created by Igor Rosocha on 12/08/21.
//

import SwiftUI

struct ImplicitAnimation: View {
    @State private var animationAmount = 1.0
    
    var body: some View {
        Button("❤️") {
            animationAmount += 1
        }
        .font(.system(size: 100))
        .scaleEffect(animationAmount)
        .animation(
            .easeInOut(duration: 0.5)
                .repeatForever(autoreverses: true),
            value: animationAmount)
    }
}

struct ImplicitAnimation_Previews: PreviewProvider {
    static var previews: some View {
        ImplicitAnimation()
    }
}
