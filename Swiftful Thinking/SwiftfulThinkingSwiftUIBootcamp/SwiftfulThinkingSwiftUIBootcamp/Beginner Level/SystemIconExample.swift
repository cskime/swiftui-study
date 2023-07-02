//
//  SystemIconExample.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by chamsol kim on 2023/05/16.
//

import SwiftUI

struct SystemIconExample: View {
    var body: some View {
//        Image(systemName: "heart.fill")
        Image(systemName: "person.fill.badge.plus")
            .renderingMode(.original)             // original로 지정하면 multi color 설정
            .font(.largeTitle)
//            .resizable()                        // resizable을 호출해야 frame에 맞게 이미지가 늘어난다.
//            .aspectRatio(contentMode: .fit)   // resizable을 사용했을 때 늘어나는 방식을 정의한다. (UIView의 content mode)
//            .scaledToFit()
//            .scaledToFill()                     // aspectRatio 사용하지 않고 바로 content mode 설정하는 방법
//            .font(.caption)
//            .font(.system(size: 200))         // font size로 image 크기를 키운다.
            .foregroundColor(.red)
//            .frame(width: 300, height: 300)     // Frame을 키워도 image 크기는 font 크기를 따라간다.
//            .clipped()                          // clipsToBounds 효과
    }
}

struct SystemIconExample_Previews: PreviewProvider {
    static var previews: some View {
        SystemIconExample()
    }
}
