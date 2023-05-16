//
//  ImageExample.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by chamsol kim on 2023/05/16.
//

import SwiftUI

struct ImageExample: View {
    var body: some View {
        Image("cat")
        // 이미지 영역에만 색상을 입힐 수 있음. 배경이 투명한 이미지일 때 의미가 있다.
        // 매번 같은 이미지에 template mode를 설정하기 귀찮다면, xcasset에서 항상 template image로 렌더링하도록 변경할 수 있다.
//            .renderingMode(.template)
            .resizable()    // safe area에 맞게 꽉 채워줌. 넘 크면 줄이고, 작으면 늘리고
//            .aspectRatio(contentMode: .fill)    // 늘리는 방법
//            .scaledToFill()
            .scaledToFit()
            .frame(width: 300, height: 200)     // 크기 설정. 이미지 크기랑은 달라서 resizable로 이미지를 frame에 맞게 조정해야함
            .foregroundColor(.red)  // 일반 이미지에는 색상을 바로 바꿀 수 없고, rendering mode를 바꿔야 함 (template image인 경우)
//            .clipped()      // frame에 맞게 자르기
//            .cornerRadius(150)  // RoundedRect나 Circle처럼 보이게 corner radius로 조정할 수도 있지만 shape clip으로 하면 좋다.
//            .clipShape(
//                Circle()
//                RoundedRectangle(cornerRadius: 25)
//                Ellipse()
//            )
    }
}

struct ImageExample_Previews: PreviewProvider {
    static var previews: some View {
        ImageExample()
    }
}
