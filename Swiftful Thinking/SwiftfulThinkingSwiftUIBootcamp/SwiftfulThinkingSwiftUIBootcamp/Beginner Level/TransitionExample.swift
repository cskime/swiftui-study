//
//  TransitionExample.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by chamsol kim on 2023/05/22.
//

import SwiftUI

struct TransitionExample: View {
    
    @State var showView = false
    
    var body: some View {
        ZStack(alignment: .bottom) {
            
            VStack {
                Button("BUTTON") {
                    /* NOTICE
                     * iOS 16.4에서는 `.animation(_:value:)` modifier를 사용해도 transition이 동작하지 않았다.
                     * `value`에 들어가는 값이 변경되는 곳에서 `withAnimation`을 써서 애니메이션을 줘야 정상적으로 동작한다.
                     */
                    
//                    withAnimation {
                    withAnimation(.spring()) {
                        showView.toggle()
                    }
                }
                Spacer()
            }
            
            /* showView를 사용해서 show/hide
             * show/hide는 ease in animation 적용
             */
            
            /* 단순 show/hide animation */
//            RoundedRectangle(cornerRadius: 30)
//                .frame(height: UIScreen.main.bounds.height * 0.5)
//                .opacity(showView ? 1 : 0)
//                .animation(.easeIn, value: showView)
            
            /* Transition으로 화면에 표시하기
             */
            
            if showView {
                RoundedRectangle(cornerRadius: 30)
                    .frame(height: UIScreen.main.bounds.height * 0.5)
//                    .transition(.slide)                   // leading에서 나타나고 trailing으로 사라짐
//                    .transition(.move(edge: .bottom))     // bottom에서 나타나고 bottom으로 사라짐
//                    .transition(.move(edge: .top))        // top에서 나타나고 top으로 사라짐
//                    .transition(.move(edge: .leading))    // leading에서 나타나고 leading으로 사라짐
//                    .transition(.move(edge: .trailing))   // trailing에서 나타나고 trailing으로 사라짐
//                    .transition(.opacity)                 // opacity 0에서 1로 나타나고, 1에서 0으로 사라짐
//                    .transition(.scale)                   // scale이 0에서 1로 나타나고, 1에서 0으로 사라짐
//                    .transition(.scale(scale: 0.5))       // 나타날 때 초기 scale과 사라질 때 마지막 scale 정의
//                    .transition(                          // 시작과 끝이 다른 transition 정의
//                        .asymmetric(
//                            insertion: .move(edge: .bottom),
//                            removal: .opacity.animation(.easeIn)
//                        )
//                    )
                
                /* NOTICE
                 * iOS 16.4에서는 이 animation을 사용해도 transition이 동작하지 않았다.
                 * Transition은 animation과 함께 써야하는 것은 맞지만, 이렇게 쓰면 안됨
                 * `value`에 들어가는 값이 변경되는 곳에서 `withAnimation`을 써서 애니메이션을 줘야 정상적으로 동작한다.
                 */
//                    .animation(.easeIn, value: showView)
            }
        }
        .ignoresSafeArea(edges: .bottom)
    }
}

struct TransitionExample_Previews: PreviewProvider {
    static var previews: some View {
        /* NOTICE
         * iOS 16.4에서 ZStack을 추가하지 않으면 preview에서 동작하지 않는 문제가 있음
         * ZStack을 써야 transition이 제대로 동작한다.
         */
        ZStack {
            TransitionExample()
        }
    }
}
