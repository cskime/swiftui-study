//
//  StepperExample.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by chamsol kim on 2023/05/30.
//

import SwiftUI

struct StepperExample: View {
    
    @State var stepperValue = 10
    @State var widthIncrement: CGFloat = 0
    
    var body: some View {
        VStack {
            Stepper("Stepper : \(stepperValue)", value: $stepperValue)
                .padding(.horizontal, 50)
            
            RoundedRectangle(cornerRadius: 25)
                .frame(width: 100 + widthIncrement, height: 100)
            
            /* 기본 Stepper는 1씩 올라가지만,
             * onIncrement / onDecrement를 사용하면 step value를 지정할 수 있다.
             */
            Stepper("Stepper 2") {
                // increment
                incrementWidth(amount: 10)
            } onDecrement: {
                // decrement
                incrementWidth(amount: -10)
            }
            .padding(.horizontal, 50)

        }
    }
    
    func incrementWidth(amount: CGFloat) {
        withAnimation(.easeInOut) {
            widthIncrement += amount
        }
    }
}

struct StepperExample_Previews: PreviewProvider {
    static var previews: some View {
        StepperExample()
    }
}
