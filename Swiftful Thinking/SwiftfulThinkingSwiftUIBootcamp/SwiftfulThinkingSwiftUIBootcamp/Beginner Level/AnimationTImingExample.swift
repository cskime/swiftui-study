//
//  AnimationTImingExample.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by chamsol kim on 2023/05/21.
//

import SwiftUI

struct AnimationTImingExample: View {
    
    @State var isAnimating = false
    let timing: Double = 0.3
    
    var body: some View {
        VStack {
            Button("Button") {
                isAnimating.toggle()
            }
            
            RoundedRectangle(cornerRadius: 20)
                .frame(width: isAnimating ? 350 : 50, height: 100)
                .animation(
//                    .spring(),
                    .spring(
                        response: 0.5,          // duration과 비슷한 개념. Spring animation이 n초동안 동작한다.
                        dampingFraction: 0.6,   // daming factor
                        blendDuration: 1
                    ),
                    value: isAnimating
                )
            
            RoundedRectangle(cornerRadius: 20)
                .frame(width: isAnimating ? 350 : 50, height: 100)
                .animation(
//                    .linear,
                    .linear(duration: timing),
                    value: isAnimating
                )
            
            RoundedRectangle(cornerRadius: 20)
                .frame(width: isAnimating ? 350 : 50, height: 100)
                .animation(
//                    .easeIn,
                    .easeIn(duration: timing),
                    value: isAnimating
                )
            
            RoundedRectangle(cornerRadius: 20)
                .frame(width: isAnimating ? 350 : 50, height: 100)
                .animation(
//                    .easeInOut,
                    .easeInOut(duration: timing),
                    value: isAnimating
                )
            
            RoundedRectangle(cornerRadius: 20)
                .frame(width: isAnimating ? 350 : 50, height: 100)
                .animation(
//                    .easeOut,
                    .easeOut(duration: timing),
                    value: isAnimating
                )
        }
    }
}

struct AnimationTImingExample_Previews: PreviewProvider {
    static var previews: some View {
        AnimationTImingExample()
    }
}
