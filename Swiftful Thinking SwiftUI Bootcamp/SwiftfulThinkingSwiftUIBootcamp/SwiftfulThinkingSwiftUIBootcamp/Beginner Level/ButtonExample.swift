//
//  ButtonExample.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by chamsol kim on 2023/05/20.
//

import SwiftUI

struct ButtonExample: View {
    var body: some View {
        Example1()
    }
}

extension ButtonExample {
    struct Example1: View {
        @State var title = "This is my title"
        var body: some View {
            VStack(spacing: 20) {
                Text(title)
                
                /* Button 만들기
                 * 1. String 직접 입력해서 text만 갖는 button 만들기
                 * 2. label에 다른 View를 넣어서 custom button 만들기
                 */
                
                // #1
                Button("Press me!") {
                    // execute
                    title = "Button #1 was pressed"
                }
                .accentColor(.red)
                
                // #2
                Button {
                    title = "Button #2 was pressed"
                } label: {
                    Text("Save".uppercased())
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding()
                        .padding(.horizontal, 20)
                        .background(
                            Color.blue
                                .cornerRadius(10)
                                .shadow(radius: 10)
                        )
                }
                
                // #3
                Button {
                    title = "Button #3"
                } label: {
                    Circle()
                        .fill(.white)
                        .frame(width: 75, height: 75)
                        .shadow(radius: 10)
                        .overlay(
                            Image(systemName: "heart.fill")
                                .font(.largeTitle)
                                .foregroundColor(.red)
                        )
                }
                
                // #4
                Button {
                    title = "Button #4"
                } label: {
                    Text("Finish".uppercased())
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                        .padding()
                        .padding(.horizontal, 10)
                        .background(
                            Capsule()
                                .stroke(.gray, lineWidth: 2)
                        )
                }
            }
        }
    }
}

struct ButtonExample_Previews: PreviewProvider {
    static var previews: some View {
        ButtonExample()
    }
}
