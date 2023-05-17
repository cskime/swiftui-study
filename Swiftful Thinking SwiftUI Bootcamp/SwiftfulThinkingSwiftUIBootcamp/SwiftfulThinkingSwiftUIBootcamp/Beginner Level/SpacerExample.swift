//
//  SpacerExample.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by chamsol kim on 2023/05/18.
//

import SwiftUI

struct SpacerExample: View {
    var body: some View {
        Example1()
        Example2()
    }
}

extension SpacerExample {
    
    struct Example2: View {
        var body: some View {
            VStack {
                HStack(spacing: 0) {
                    Image(systemName: "xmark")
                    Spacer()    // 좌우로 image들을 화면 양 끝으로 밀기 위해 가운데 space 추가
//                        .frame(height: 10)
//                        .background(.orange)
                    Image(systemName: "gear")
                }
                .font(.title)
//                .background(.yellow)
                .padding(.horizontal)
//                .background(.blue)
                
                Spacer()    // HStack을 위로 올리기 위해 vertical center space 추가
//                    .frame(width: 10)
//                    .background(.orange)
                
                Rectangle()
                    .frame(height: 55)
            }
//            .background(.yellow)
        }
    }
    
    struct Example1: View {
        var body: some View {
            HStack(spacing: 0) {  // content를 꽉 채우려고 할 떄 spacing 직접 계산하기 어려움
                Spacer(minLength: 0)  // minimum length를 설정하면, 최소 길이 고정
                                        // default가 8~10 이라서 Spacer 너비가 아예 없어지지는 않는다.
                                        // minLength를 0으로 설정해야 0이 될 수 있다.
                    .frame(height: 10)
                    .background(.orange)
                
                Rectangle()
                    .frame(width: 50, height: 50)
                
                Spacer()    // 가능한 최대 너비로 늘려준다.
                    .frame(height: 10)  // frame도 설정 가능 (View protocol 상속)
                    .background(.orange)
                
                Rectangle()
                    .fill(.red)
                    .frame(width: 50, height: 50)
                
                Spacer()
                    .frame(height: 10)
                    .background(.orange)
                
                Rectangle()
                    .fill(.green)
                    .frame(width: 50, height: 50)
                
                /* Stack에 spacer가 둘 이 상 있으면, 모든 spacer가 같은 길이를 가진다. */
                Spacer(minLength: 0)
                    .frame(height: 10)
                    .background(.orange)
            }
            .background(.yellow)
//            .padding(.horizontal, 200)
            .background(.blue)
        }
    }
}

struct SpacerExample_Previews: PreviewProvider {
    static var previews: some View {
        SpacerExample()
    }
}
