//
//  SafeAreaInsetBootcamp.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by chamsol kim on 2023/06/11.
//

import SwiftUI

struct SafeAreaInsetBootcamp: View {
    var body: some View {
        NavigationStack {
            List(0..<10) { _ in
                Rectangle().frame(height: 300)
            }
            .navigationTitle("Safe Area Insets")
            .navigationBarTitleDisplayMode(.inline)
//            .overlay(alignment: .bottom) {
//                Text("Hi")
//                    .frame(maxWidth: .infinity)
//                    .background(Color.yellow)
//            }
            /* Hover view 만들기
             * Overlay를 사용한다면 직접 safe area inset을 고려해서 UI를 배치해야 할 것
             * safeAreaInset을 사용하면 쉽게 safe area inset을 적용할 수 있다.
             * Edge에
             */
            .safeAreaInset(edge: .top, alignment: .center, spacing: nil) {
                Text("Hi")
                    .frame(height: 50)
                    .frame(maxWidth: .infinity)
//                    .padding()
                    .background(Color.yellow.ignoresSafeArea(edges: .bottom))
//                    .clipShape(Circle())
//                    .padding()
            }
            
            .safeAreaInset(edge: .bottom, alignment: .trailing, spacing: nil) {
                Button("Add") {
                    print("Add")
                }
                //                    .frame(maxWidth: .infinity)
                .padding()
                .background(Color.yellow)
                .clipShape(Circle())
                .padding()
            }
        }
    }
}

struct SafeAreaInsetBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        SafeAreaInsetBootcamp()
    }
}
