//
//  StateExample.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by chamsol kim on 2023/05/20.
//

import SwiftUI

struct StateExample: View {
    var body: some View {
        Example1()
    }
}

extension StateExample {
    struct Example1: View {
        /* 버튼을 누르면 background color가 바뀌게 만들기 위해 var로 변경
         * 하지만, SwiftUI에서는 View가 값이 변하는걸 알도록 만들어야 함. 따라서, @State를 사용한다.
         * @State var는 View에게 이 값을 관찰(watch)하라고 알려줌.
         * 이 값이 바뀌면 View를 update해야 함. @State 값이 바뀌면 SwiftUI View는 body를 갱신한다. (전체를 다시 그림)
         */
        @State
        var backgroundColor: Color = .green
        
        @State
        var myTitle = "My Title"
        
        @State
        var count = 0
        
        var body: some View {
            ZStack {
                // background
                backgroundColor
                    .ignoresSafeArea()
                
                // content
                VStack(spacing: 30) {
                    Text(myTitle)
                        .font(.title)
                    Text("Count : \(count)")
                        .font(.headline)
                        .underline()
                    
                    HStack(spacing: 20) {
                        Button("BUTTON 1") {
                            backgroundColor = .red
                            myTitle = "Button 1 was pressed"
                            count += 1
                        }
                        
                        Button("BUTTON 2") {
                            backgroundColor = .purple
                            myTitle = "Button 2 was pressed"
                            count -= 1
                        }
                    }
                }
                .foregroundColor(.white)
            }
        }
    }
}

struct StateExample_Previews: PreviewProvider {
    static var previews: some View {
        StateExample()
    }
}
