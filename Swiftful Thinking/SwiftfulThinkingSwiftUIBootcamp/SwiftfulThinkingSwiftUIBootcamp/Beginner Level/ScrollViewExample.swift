//
//  ScrollViewExample.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by chamsol kim on 2023/05/20.
//

import SwiftUI

struct ScrollViewExample: View {
    var body: some View {
        Example1()
        Example2()
    }
}

extension ScrollViewExample {
    struct Example1: View {
        var body: some View {
            /* axes에 스크롤 방향을 지정할 수 있다. horizontal로 설정했을 땐 VStack 대신 HStack을 써야 효과가 있을 것.
             * showsIndicators로 스크롤 할 때 핸들 표시 여부를 결정한다.
             */
            ScrollView(.horizontal, showsIndicators: true) {
//            ScrollView {
                HStack {
                    ForEach(0..<50) { index in
                        Rectangle()
                            .fill(.blue)
                            .frame(width: 300, height: 300)
                    }
                }
            }
        }
    }
    
    struct Example2: View {
        /* Compositional Layout - Scroll view 안에 scroll view
         */
        var body: some View {
            ScrollView {
//                VStack {
                /* 일반 VStack, HStack을 사용하면, 한 번에 모든 View가 즉시 생성되고 로드된다.
                 * (작은 data set이면 괜찮지만, 많아지면 문제가 됨)
                 * Data set이 크면 LazyV/HStack을 쓰는 것을 권장함
                 */
                LazyVStack {
                    ForEach(0..<10) { index in
                        ScrollView(.horizontal, showsIndicators: false) {
//                            HStack {
                            LazyHStack {
                                ForEach(0..<20) { index in
                                    RoundedRectangle(cornerRadius: 25)
                                        .fill(.white)
                                        .frame(width: 200, height: 150)
                                        .shadow(radius: 10)
                                        .padding()  // VStack의 spacing은 그대로 두고 shadow가 겹치지 않게 padding을 줌
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

struct ScrollViewExample_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewExample()
    }
}
