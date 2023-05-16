//
//  FrameExample.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by chamsol kim on 2023/05/16.
//

import SwiftUI

struct FrameExample: View {
    var body: some View {
        // Frame은 Text, Image, Shape 등 모든 View에서 사용할 수 있는 modifier
        Text("Hello, World! Hello again!")   // 파란 선이 frame을 나타냄. content에 맞게 크기가 자동으로 조정된다.
        /* Frame 동작 방식
         * frame 전과 후에 적용하는 background가 다르다.
         */
//            .background(.green) // Content의 background
//            .frame(width: 300, height: 300, alignment: .leading)    // alignment : content를 frame 안에서 정렬하는 방식
//            .background(.red)   // Frame의 background
//            .frame(
//                minWidth: 0,
//                idealWidth: 100,
//                maxWidth: .infinity,    // as bis as possible with in a parent frame
//                minHeight: 0,
//                idealHeight: 100,
//                maxHeight: .infinity,
//                alignment: .leading
//            )
//            .background(Color.red.ignoresSafeArea(edges: []))   // 왜 safe area를 자동으로 무시하지????
            
        /* Frame modifier를 사용하고 background를 추가할 때 마다 사각형 영역이 stack처럼 쌓인다.
         * 변경된 frame으로 background를 추가하므로 stack처럼 쌓이게 되는 것
         */
            .background(.red)                       // 최초 content와 같은 background
            .frame(height: 100, alignment: .top)    // 변경된 frame에서 alignment 지정. Red를 위로 올릴 것
            .background(.orange)            // 높이가 100으로 변경된 후 background
            .frame(width: 150)
            .background(.purple)            // 너비가 150으로 변경된 후 background
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(.pink)              // 화면에 꽉 차는 너비로 변경된 후 background
            .frame(height: 400)
            .background(.green)             // 높이가 400으로 변경된 후 background
            .frame(maxHeight: .infinity, alignment: .top)   // 변경된 frame에서 alignment 지정. Green 아래로 alignment 영향 받음
            .background(.yellow)    // 화면에 꽉 차는 너비로 변경된 후 background
            .ignoresSafeArea(edges: [])
    }
}

struct FrameExample_Previews: PreviewProvider {
    static var previews: some View {
        FrameExample()
    }
}
