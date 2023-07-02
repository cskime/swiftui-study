//
//  AnimationUpdatedBootcamp.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by chamsol kim on 2023/06/16.
//

import SwiftUI

/*
 */

struct AnimationUpdatedBootcamp: View {
    
    @State private var animate1 = false
    @State private var animate2 = false
    
    var body: some View {
        ZStack {
            VStack(spacing: 40) {
                Button("Action 1") {
                    animate1.toggle()
                }
                
                Button("Action 2") {
                    animate2.toggle()
                }
                
                ZStack {
                    Rectangle()
                        .frame(width: 100, height: 100)
                        .frame(maxWidth: .infinity, alignment: animate1 ? .leading : .trailing)
                        .background(.green)
                        .frame(maxHeight: .infinity, alignment: animate2 ? .top : .bottom)
                        .background(.orange)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(.red)
            }
        }
//        .animation(.spring())
        /* 각 요소에 따라 다른 animation을 주고 싶을 때 사용할 수 있게 value로 animation을 결정한다.
         * `value`가 변경될 때만 해당 animation을 실행한다.
         */
        .animation(.spring(), value: animate1)
        .animation(.linear(duration: 5), value: animate2)
    }
}

struct AnimationUpdatedBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        AnimationUpdatedBootcamp()
    }
}
