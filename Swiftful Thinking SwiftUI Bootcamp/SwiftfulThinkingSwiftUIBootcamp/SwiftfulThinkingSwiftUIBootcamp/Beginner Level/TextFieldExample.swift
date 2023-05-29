//
//  TextFieldExample.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by chamsol kim on 2023/05/29.
//

import SwiftUI

struct TextFieldExample: View {
    
    @State var textFieldText = ""
    @State var dataArray = [String]()
    
    var body: some View {
        NavigationStack {
            VStack {
                /* TextField에 text를 입력하면 textFieldText에 바인딩되어 저장될 것
                 */
                TextField("Type something here...", text: $textFieldText)
                    .padding()
                    .background(Color.gray.opacity(0.3).cornerRadius(10))
                    .foregroundColor(.red)
                    .font(.headline)
                
                Button {
                    guard textIsAppropriate else {
                        return
                    }
                    saveText()
                } label: {
                    Text("Save".uppercased())
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(textIsAppropriate ? .blue : .gray)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .font(.headline)
                }
                .disabled(!textIsAppropriate)
                
                ForEach(dataArray, id: \.self) { data in
                    Text(data)
                }
                
                Spacer()
            }
            .padding()
            .navigationTitle("TextFiled Bootcamp!")
        }
    }
    
    var textIsAppropriate: Bool {
        textFieldText.count >= 3
    }
    
    func saveText() {
        dataArray.append(textFieldText)
        textFieldText = ""
    }
}

struct TextFieldExample_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldExample()
    }
}
