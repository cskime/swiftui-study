//
//  SafeAreaExample.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by chamsol kim on 2023/05/20.
//

import SwiftUI

struct SafeAreaExample: View {
    var body: some View {
        Example1()
        Example2()
    }
}

extension SafeAreaExample {
    struct Example1: View {
        /* ios 16부터는 background가 safe area를 무시하는 것 같다.*/
        var body: some View {
            ZStack {
                
                // background
                
                Color.blue
                    .edgesIgnoringSafeArea(.all)
                
                // foreground
                
                VStack {
                    Text("Hello, World!")
                    Spacer()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(.red)
//                .edgesIgnoringSafeArea(.all)
            }
        }
    }
    
    struct Example2: View {
        var body: some View {
            ScrollView {
                VStack {
                    Text("Title goes here.")
                        .font(.largeTitle)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    ForEach(0..<10) { index in
                        RoundedRectangle(cornerRadius: 25)
                            .fill(.white)
                            .frame(height: 150)
                            .shadow(radius: 10)
                            .padding(20)
                    }
                }
            }
            .background(
                /* Color도 view의 일종. background view만 safe area를 무시하게 만들면
                 * content는 그대로 두고 background만 꽉 차게 만들 수 있다.
                 */
//                Color.red.edgesIgnoringSafeArea(.all)
                Color.red
//                    .ignoresSafeArea()  // iOS 14.3부터 변경됨
                    .ignoresSafeArea(edges: .bottom)
                
                /* iOS 16부터는 아마 safe area를 무시하는게 기본인 것 같다.
                 * bottom만 먹이면 background가 safe area에 맞게 설정되는걸 볼 수 있다.
                 */
//                Color.red.edgesIgnoringSafeArea(.leading)
            )
            .background(.blue)
//            .edgesIgnoringSafeArea(.all)  // Scroll view에 설정하면 content들도 safe area를 넘어서 좋지 않다.
        }
    }
}

struct SafeAreaExample_Previews: PreviewProvider {
    static var previews: some View {
        SafeAreaExample()
    }
}
