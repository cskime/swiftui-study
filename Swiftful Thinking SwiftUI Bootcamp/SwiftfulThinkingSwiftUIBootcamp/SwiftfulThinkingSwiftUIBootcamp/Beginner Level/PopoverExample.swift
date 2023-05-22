//
//  PopoverExample.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by chamsol kim on 2023/05/22.
//

import SwiftUI

struct PopoverExample: View {
    
    /* Sheet, Transition, Animation 을 사용해서 같은 view를 만들어보고 차이점을 알아본다.
     * 상황에 따라 어떤 것을 사용해야할지 판단할 수 있어야 한다.
     
     * Sheet
     *   1. Default animation을 사용할 수 있다.
     *   2. Environment를 사용해야 한다.
     *   3. dismiss 시점을 쉽게 catch해서 특정 동작을 실행할 수 있다. (onDismiss)
     
     * Transition
     *   1. Animation을 dynamic하게 만들기 좋다.
     *   2. Transition animation을 직접 구현해야 한다.
     *   3. Z-Index와 관련된 버그가 있어서 주의해야 한다.
     
     * Animate Offset
     *   1. UIKit에서도 종종 사용하던 방법이라 친숙하다.
     *   2. 단순한 animation을 쉽게 만들 수 있다.
     *   3. 복잡한 animation을 구현하려면 난이도가 올라간다.
     */
    
    @State var showNewScreen = false
    
    var body: some View {
        ZStack {
            Color.orange
                .ignoresSafeArea()
            
            VStack {
                Button("BUTTON") {
                    // #1 - Sheet
//                    showNewScreen.toggle()
                    
                    // #2 - Transition
                    withAnimation {
                        showNewScreen.toggle()
                    }
                }
                .font(.largeTitle)
                
                Spacer()
            }
            
            // #1 - Sheet
//            .sheet(isPresented: $showNewScreen) {
//                print("Dismiss Sheet")
//            } content: {
//                NewScreen()
//            }
            
            
            // #2 - Transition
//            if showNewScreen {
//                NewScreen(showNewScreen: $showNewScreen)
//                    .padding(.top, 100)
//                    .transition(.move(edge: .bottom))
//                    .zIndex(1)
                /* showNewScreen을 false로 바꿔서 dismiss할 때 transition이 적용되지 않는 문제
                 * 분석 : https://sarunw.com/posts/how-to-fix-zstack-transition-animation-in-swiftui/
                 * 원인
                 *    1. showNewScreen이 false가 되면, SwiftUI는 PopoverExample 전체를 다시 그린다.
                 *    2. 이 때, NewScreen이 transition 중인 상태에서 orange color view가 다시 그려지면서 NewScreen을 덮는다.
                 *    3. 따라서, transition이 동작하지 않는 것 처럼 보인다. 실제로는 orange view 뒤에서 transition이 동작하고 있다.
                 * 해결
                 *    1. ZStack에서 화면 앞에 있을수록 zIndex가 높다.
                 *    2. Transition을 적용한 view와 그것을 덮는 view의 zIndex가 모두 0일 때 이 문제가 발생한다.
                 *    3. NewScreen의 zIndex를 0보다 크게(1도 괜찮) 설정한다.
                 *    4. 이제 SwiftUI가 view를 다시 그려도, orange view 위에서 NewScreen의 transition이 동작하므로 애니메이션을 볼 수 있다.
                 */
//            }

            
            // #3 - Animation Offset
            NewScreen(showNewScreen: $showNewScreen)
                .padding(.top, 100)
                .offset(y: showNewScreen ? .zero : UIScreen.main.bounds.height)
                .animation(.spring(), value: showNewScreen)
        }
    }
}

struct NewScreen: View {
    
    @Environment(\.dismiss) var dismiss
    @Binding var showNewScreen: Bool
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Color.purple
                .ignoresSafeArea()
            
            Button {
                // #1 - Sheet
//                dismiss()
                
                // #2 - Transition
                withAnimation {
                    showNewScreen.toggle()
                }
                
            } label: {
                Image(systemName: "xmark")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .padding(20)
            }

        }
    }
}

struct PopoverExample_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            PopoverExample()
        }
//        NewScreen()
    }
}
