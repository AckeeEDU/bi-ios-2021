//
//  Transition.swift
//  Animations
//
//  Created by Igor Rosocha on 12/08/21.
//

import SwiftUI

struct Transition: View {
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
                .transition(.asymmetric(insertion: .scale, removal: .opacity))
            }
        }
    }
}

struct Transition_Previews: PreviewProvider {
    static var previews: some View {
        Transition()
    }
}
