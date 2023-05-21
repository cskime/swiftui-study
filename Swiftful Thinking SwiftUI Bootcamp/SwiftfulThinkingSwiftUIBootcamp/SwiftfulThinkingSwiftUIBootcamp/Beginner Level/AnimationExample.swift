//
//  AnimationExample.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by chamsol kim on 2023/05/21.
//

import SwiftUI

struct AnimationExample: View {
    
    @State var isAnimated = false
    
    var body: some View {
        VStack {
            Button("Button") {
                /* Animation을 사용하게 될 코드를 withAnimation block 안에 작성한다.
                 * Animation 옵션 설정
                 * - delay : 딜레이 실행
                 * - repeatCount : 애니메이션 반복. (autoreverse가 true면 다시 돌아오는 것까지 횟수로 포함)
                 * - repeatForever : 애니메이션 무한 반복
                 */
//                withAnimation(
//                    .easeIn
//                        .delay(2.0)
//                        .repeatCount(3, autoreverses: true)
//                        .repeatForever(autoreverses: true)
//                ) {
//                    isAnimated.toggle()
//                }
                
                
                isAnimated.toggle()
            }
            
            Spacer()
            
            RoundedRectangle(cornerRadius: isAnimated ? 50 : 25)
                .fill(isAnimated ? .red : .green)
                .frame(
                    width: isAnimated ? 100 : 300,
                    height: isAnimated ? 100 : 300
                )
                // Rotation 효과 적용
                .rotationEffect(Angle(degrees: isAnimated ? 360 : 0))
                // frame은 변경하지 않고 위치만 이동시켜줌
                .offset(y: isAnimated ? 300 : 0)
//                .animation(.easeIn) // iOS 15에서 deprecated 됐는데?
                .animation(.easeIn, value: isAnimated)
            
            Spacer()
        }
    }
}

struct AnimationExample_Previews: PreviewProvider {
    static var previews: some View {
        AnimationExample()
    }
}
