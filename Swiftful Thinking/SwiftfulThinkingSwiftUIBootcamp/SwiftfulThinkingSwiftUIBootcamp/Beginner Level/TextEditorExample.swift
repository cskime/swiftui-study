//
//  TextEditorExample.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by chamsol kim on 2023/05/29.
//

import SwiftUI

struct TextEditorExample: View {
    
    @State var textEditorText = "This is the starting text."
    @State var savedText = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                /* 여러 줄 입력해야 할 때 TextField 대신 사용
                 */
                TextEditor(text: $textEditorText)
                    .frame(height: 250)
                    .foregroundColor(.red)
                /* TextEditor의 기본 배경은 흰색이지만 backgroundColor로 바꿀 수 없음
                 * colorMultiply를 사용해야 바뀌는데, 이유를 모르겠다..
                 */
//                    .background(.red)
                    .colorMultiply(.red)
                    .cornerRadius(10)
                
                Button {
                    savedText = textEditorText
                } label: {
                    Text("Save".uppercased())
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(.blue)
                        .cornerRadius(10)
                }
                
                Text(savedText)
                
                Spacer()
            }
            .padding()
            .background(Color.green.ignoresSafeArea(edges: [.leading, .trailing]))
            .navigationTitle("TextEditor Bootcamp!")
        }
    }
}

struct TextEditorExample_Previews: PreviewProvider {
    static var previews: some View {
        TextEditorExample()
    }
}
