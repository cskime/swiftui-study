//
//  BackgroundOverlayExample.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by chamsol kim on 2023/05/17.
//

import SwiftUI

struct BackgroundOverlayExample: View {
    var body: some View {
        BackgroundExample()
        OverlayExample()
        RealWorldExample()
    }
}

struct BackgroundExample: View {
    var body: some View {
        Text("Hello, World!")
//            .frame(width: 100, height: 100, alignment: .center)
        /* View는 무엇이든 넣을 수 있음. Text, shape, color */
            .background(
//                .blue
//                LinearGradient(
//                    gradient: Gradient(colors: [.red, .blue]),
//                    startPoint: .leading,
//                    endPoint: .trailing
//                )
                Circle()
//                    .fill(.blue)
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [.red, .blue]),
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .frame(width: 100, height: 100, alignment: .center) // 대상(circle)에 직접 frame 변경할 수 있다.
            )
        /* background로 중첩할 수 있다. */
//            .frame(width: 120, height: 120, alignment: .center)
            .background(
                Circle()
//                    .fill(.red)
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [.blue, .red]),
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .frame(width: 120, height: 120, alignment: .center)
            )
    }
}

struct OverlayExample: View {
    var body: some View {
//        Circle()
//            .fill(.pink)
//            .frame(width: 100, height: 100, alignment: .center)
//            .overlay {          // overlay는 pink circle의 앞에 추가됨
//                Text("1")
//                    .font(.largeTitle)
//                    .foregroundColor(.white)
//            }
//            .background(        // background는 pink circle의 뒤에 추가됨
//                Circle()
//                    .fill(.purple)
//                    .frame(width: 110, height: 110, alignment: .center)
//            )
        
        Rectangle()
            .frame(width: 100, height: 100)
            .overlay(alignment: .top) {         // overlay된 content를 현재 view의 top에 align (center alignment for default)
                Rectangle()
                    .fill(.blue)
                    .frame(width: 50, height: 50)
            }
            .background(alignment: .bottom) {   // 현재 view를 background된 content의 bottom에 align (center alignment for default)
                Rectangle()
                    .fill(.red)
                    .frame(width: 150, height: 150)
            }
    }
}

struct RealWorldExample: View {
    var body: some View {
        /* Background, overlay들이 stack처럼 쌓인다.
         * 계층 : 보라색 Circle(background) -> 파란색 Circle(overlay) -> Text("5") -> Image
         */
        Image(systemName: "heart.fill")
            .font(.system(size: 40))
            .foregroundColor(.white)
            .background(
                Circle()
                    .fill(
                        LinearGradient(
//                            gradient: Gradient(colors: [Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)), Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1))]),
                            gradient: Gradient(colors: [Color(red: 0.5, green: 0.3, blue: 0.9), Color(red: 0.3, green: 0.06, blue: 0.9)]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 100, height: 100)
                    .shadow(
                        color: Color(red: 0.5, green: 0.3, blue: 0.9, opacity: 0.5),
                        radius: 10,
                        x: 0,
                        y: 10
                    )
                    .overlay(alignment: .bottomTrailing) {
                        Circle()
                            .fill(.blue)
                            .frame(width: 35, height: 35)
                            .overlay(
                                Text("5")
                                    .font(.headline)
                                    .foregroundColor(.white)
                            )
                            .shadow(
                                color: Color(red: 0.5, green: 0.3, blue: 0.9, opacity: 0.5),
                                radius: 10,
                                x: 5,
                                y: 5
                            )
                    }
            )
    }
}

struct BackgroundOverlayExample_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundOverlayExample()
    }
}
