//
//  PaddingExample.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by chamsol kim on 2023/05/18.
//

import SwiftUI

struct PaddingExample: View {
    var body: some View {
        Example1()
        Example2()
        Example3()
    }
}

extension PaddingExample {
    
    struct Example3: View {
        var body: some View {
            VStack(alignment: .leading) {
                Text("Hello, World!")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .padding(.bottom, 20)   // 요소 사이 spacing 줄 떄 padding 사용
                
                Text("This is the description of what we will do on this screen. It is multiple lines and we will align the text to the leading edge.")
            }
//            .background(.blue)
            .padding()
            .padding(.vertical, 30)
            .background(
//                .red
                Color.white
                    .cornerRadius(10)   // Color에도 직접 corner radius를 줄 수 있다.
                    .shadow(
                        color: .black.opacity(0.3),
                        radius: 10,
                        x: 0,
                        y: 10
                    )
            )
            .padding(.horizontal, 10)
//            .background(.green)
        }
    }
    
    struct Example2: View {
        var body: some View {
            Text("Hello, World!")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)    // 늘어난 frame 안에서 content의 alignment 지정
                .background(.red)
                .padding(.leading, 20)  // 와면 꽉 차고 좌우 inset 줄 때 infinity width frame으로 만든 뒤 padding
                .background(.blue)
        }
    }
    
    struct Example1: View {
        var body: some View {
            Text("Hello, World! This is fun.")
                .frame(width: 300, height: 100) // frame을 늘려서 여백 만들는 것. 비추
                .background(.yellow)
                .padding()  // edge에 원하는 만큼 padding 추가
                .padding(.all, 10)  // 기본값 .all
                .padding(.top, 50) // top, leading, trailing, bottom, vertical, horizontal 지정 가능
                .padding(.bottom, 30)   // padding 중첩 가능
                .background(.blue)
        }
    }
}

struct PaddingExample_Previews: PreviewProvider {
    static var previews: some View {
        PaddingExample()
    }
}
