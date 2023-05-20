//
//  ForEachExample.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by chamsol kim on 2023/05/20.
//

import SwiftUI

struct ForEachExample: View {
    var body: some View {
        Example1()
        Example2()
    }
}

extension ForEachExample {
    
    struct Example1: View {
        var body: some View {
            VStack {
                ForEach(0..<10) { index in      // 여러 개의 view들을 반복적으로 화면에 추가한다.
//                    Text("Hi : \(index)")
                    HStack {
                        Circle()
                            .frame(width: 30, height: 30)
                        Text("Index is \(index)")
                    }
                }
            }
        }
    }
    
    struct Example2: View {
        let data = ["Hi", "Hello", "Hey everyone"]
        let myString = "Hello"
        var body: some View {
            VStack {
                ForEach(data.indices) { index in
//                    Text("NEW ITEM : \(index)")
                    Text("\(data[index]) : \(index)")
                }
            }
        }
    }
}

struct ForEachExample_Previews: PreviewProvider {
    static var previews: some View {
        ForEachExample()
    }
}
