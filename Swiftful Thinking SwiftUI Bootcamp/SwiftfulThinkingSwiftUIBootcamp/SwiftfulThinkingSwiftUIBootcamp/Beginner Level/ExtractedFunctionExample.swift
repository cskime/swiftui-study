//
//  ExtractedFunctionExample.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by chamsol kim on 2023/05/20.
//

import SwiftUI

struct ExtractedFunctionExample: View {
    /* body가 너무 길어지면 유지보수가 어려워지므로
     * body 코드를 깔끔하고 단순하게 유지하기 위해 subview로 빼거나
     * function을 통해 만들도록 추출한다.
     */
    
    @State
    var backgroundColor: Color = .pink
    
    var body: some View {
        ZStack {
            backgroundColor
                .ignoresSafeArea()
            
            /* VStack block 전체를 별도의 property 또는 method로 추출
             */
            contentLayer
//            VStack {
//                Text("Title")
//                    .font(.largeTitle)
//
//                Button {
//                    /* 버튼 선택 시 실행할 로직이 복잡해지고 길어질 수 있음
//                     * 로직을 view에 직접 가지고 있지 않고, 함수로 추출한다.
//                     */
//                    backgroundColor = .yellow
//                } label: {
//                    Text("PRESS ME")
//                        .font(.headline)
//                        .foregroundColor(.white)
//                        .padding()
//                        .background(.black)
//                        .cornerRadius(10)
//                }
//
//                // action을 추출한 함수로 교체
//                Button(action: buttonPressed) {
//                    Text("PRESS ME")
//                        .font(.headline)
//                        .foregroundColor(.white)
//                        .padding()
//                        .background(.black)
//                        .cornerRadius(10)
//                }
//            }
        }
    }
    
    var contentLayer: some View {
        VStack {
            Text("Title")
                .font(.largeTitle)
            
            Button {
                /* 버튼 선택 시 실행할 로직이 복잡해지고 길어질 수 있음
                 * 로직을 view에 직접 가지고 있지 않고, 함수로 추출한다.
                 */
                backgroundColor = .yellow
            } label: {
                Text("PRESS ME")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(.black)
                    .cornerRadius(10)
            }
            
            // action을 추출한 함수로 교체
            Button(action: buttonPressed) {
                Text("PRESS ME")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(.black)
                    .cornerRadius(10)
            }
        }
    }
    
    func buttonPressed() {
        backgroundColor = .yellow
    }
}

struct ExtractedFunctionExample_Previews: PreviewProvider {
    static var previews: some View {
        ExtractedFunctionExample()
    }
}
