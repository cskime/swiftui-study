//
//  SubmitTextFieldBootcamp.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by chamsol kim on 2023/06/04.
//

import SwiftUI

/* 키보드의 return 버튼을 커스터마이징 할 수 있다.
 */
struct SubmitTextFieldBootcamp: View {
    
    @State private var text: String = ""
    
    var body: some View {
        TextField("Placeholder...", text: $text)
            /* Submit button(return)의 text 및 style을 변경할 수 있다. 미리 지정된 SubmitLabel enum에서 선택
             */
            .submitLabel(.route)
            /* Submit button(return)을 선택할 때 호출
             */
            .onSubmit {
                print("Something to the console!")
            }
        
        TextField("Placeholder...", text: $text)
            .submitLabel(.next)
            /* Submit button(return)을 선택할 때 호출
             */
            .onSubmit {
                print("Something to the console!")
            }
        
        TextField("Placeholder...", text: $text)
            .submitLabel(.search)
            /* Submit button(return)을 선택할 때 호출
             */
            .onSubmit {
                print("Something to the console!")
            }
    }
}

struct SubmitTextFieldBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        SubmitTextFieldBootcamp()
    }
}
