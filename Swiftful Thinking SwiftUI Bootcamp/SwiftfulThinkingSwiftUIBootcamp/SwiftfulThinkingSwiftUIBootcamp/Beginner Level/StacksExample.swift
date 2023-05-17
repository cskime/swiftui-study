//
//  StacksExample.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by chamsol kim on 2023/05/17.
//

import SwiftUI

struct StacksExample: View {
    var body: some View {
        Example1()
        Example2()
        Example3()
    }
}

struct Example1: View {
    var body: some View {
        //        VStack {    // VStack(content:)
                // spacing이 nil이면 기본값 8로 설정
                // alignment : Stack 안에서 content들의 정렬
                ZStack(
        //            alignment: .center,
        //            alignment: .leading,    // VStack은 leading, trailing alignment
                    alignment: .top          // HStack은 top, bottom alignment
        //            spacing: nil              // ZStack은 spacing 속성이 없음, 모든 alignment 사용 가능 (topLeading 등 포함 8개)
                ) {
                    Rectangle()
                        .fill(.red)
                        .frame(width: 200, height: 200)
                    
                    Rectangle()
                        .fill(.green)
                        .frame(width: 150, height: 150)
                    
                    Rectangle()
                        .fill(.orange)
                        .frame(width: 100, height: 100)
                }
    }
}

struct Example2: View {
    var body: some View {
//        ZStack {
        ZStack(alignment: .top) {   // ZStack content들의 alignment 설정
            // Background Layer
            Rectangle()
                .fill(.yellow)
                .frame(width: 350, height: 500)
            
            // VStack Layer
//            VStack {
            VStack(alignment: .leading, spacing: 30) {   // VStack content들의 alignment 및 spacing설정
                Rectangle()
                    .fill(.red)
                    .frame(width: 150, height: 150)
                
                Rectangle()
                    .fill(.green)
                    .frame(width: 100, height: 100)
                
                HStack {
                    Rectangle()
                        .fill(.purple)
                        .frame(width: 50, height: 50)
                    
                    Rectangle()
                        .fill(.pink)
                        .frame(width: 75, height: 75)
                    
                    Rectangle()
                        .fill(.blue)
                        .frame(width: 25, height: 25)
                }
                .background(.white)
            }
            .background(.black)
        }
    }
}

struct Example3: View {
    var body: some View {
//        VStack(alignment: .center, spacing: 20) {
//            Text("5")
//                .font(.largeTitle)
//                .underline()
//
//            Text("Items in your cart:")
//                .font(.caption)
//                .foregroundColor(.gray)
//        }
        
        
        /* ZStack과 background 차이 */
        // 둘 다 동일한 결과를 만들어 낼 수 있음.
        VStack(spacing: 50) {
            // 여러 개의 layer를 겹쳐놓으려는 경우 ZStack이 더 쉽다.
            ZStack {
                Circle()
                    .frame(width: 100, height: 100)
                
                Text("1")
                    .font(.title)
                    .foregroundColor(.white)
            }
            
            // 앞/뒤에 content 1개만 넣어서 만드는 경우
            // ZStack보다 background/overlay를 이용하는게 더 좋다.
            // 단, background를 사용했을 때는 frame에 영향을 주지 않으므로
            // 이 예제에서 background로 만든 영역은 VStack에 포함되지 않고 Text만 frame에 영향을 줬다.
            Text("1")
                .font(.title)
                .foregroundColor(.white)
                .background(
                    Circle()
                        .frame(width: 100, height: 100)
                )
        }
    }
}

struct StacksExample_Previews: PreviewProvider {
    static var previews: some View {
        StacksExample()
    }
}
