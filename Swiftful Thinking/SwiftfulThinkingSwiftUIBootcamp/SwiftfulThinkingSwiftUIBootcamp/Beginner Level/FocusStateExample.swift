//
//  FocusStateExample.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by chamsol kim on 2023/06/04.
//

import SwiftUI

/* @FocusState
 * TextField같은 SwiftUI control의 focus state를 읽고 쓸 수 있게 만들어 주는 property wrapper
 * - focused(_:) : FocusState<Bool>.Binding 1개만 전달하는 modifier는 여러 개의 control의 focus state를 각각 관리해야 함
 * - focused(_:equals:) : FocusState<Hashable>.Binding과 Hashable을 전달하는 modifier는 여러 개의 control의 focus state를 하나의 @FocusState로 관리할 수 있게 해 준다.
 */
struct FocusStateExample: View {
    
    enum OnbordingFileds: Hashable {
        case username
        case password
    }
    
    /* TextField가 focus될 떄 true가 되도록 binding 됨
     * Binding된 TextField의 focus state를 결정한다.
     */
//    @FocusState private var usernameInFocus: Bool
    @State private var username = ""
    
//    @FocusState private var passwordInFocus: Bool
    @State private var password = ""
    
    @FocusState private var fieldInFocus: OnbordingFileds?
    
    var body: some View {
        VStack {
            TextField("Add your name here...", text: $username)
                // 1. Bool타입으로 각각의 focus state를 직접 제어하기
//                .focused($usernameInFocus)
            
                // 2. Bool타입으로 각각의 focus state를 직접 제어하기
                .focused($fieldInFocus, equals: .username)
                .padding(.leading)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color.gray.brightness(0.3))
                .cornerRadius(10)
            
            /* Password 등 보안을 신경써야 하는 input을 입력받을 때 typing한 text를 * 표시로 바꿔서 표시해준다.
             * UITextField에서는 option을 바꿔서 사용했지만, SwiftUI는 control이 따로 있다.
             */
            SecureField("Add your password here...", text: $password)
                // 1. Bool타입으로 각각의 focus state를 직접 제어하기
//                .focused($usernameInFocus)
            
                // 2. Bool타입으로 각각의 focus state를 직접 제어하기
                .focused($fieldInFocus, equals: .password)
                .padding(.leading)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color.gray.brightness(0.3))
                .cornerRadius(10)
            
            Button("Sign Up 🚀") {
                let usernameIsValid = !username.isEmpty
                let passwordIsValid = !password.isEmpty
                
                if usernameIsValid && passwordIsValid {
                    print("Sign Up")
                } else if usernameIsValid {
                    /* FocusState는 한 번에 하나의 control만 true가 될 수 있으므로
                     * 다른 control로 변경할 때는 false를 명시적으로 할당하지 않아도 괜찮다.
                     */
//                    usernameInFocus = false
//                    passwordInFocus = true
                    
                    fieldInFocus = .password
                } else {
//                    usernameInFocus = true
//                    passwordInFocus = false
                    
                    fieldInFocus = .username
                }
            }
            
//            Button("Toggle Focus State") {
                  /* usernameInFocus가 true/false로 변경됨
                   * -> FocusState 변경
                   * -> binding된 TextField로 값 전달
                   * -> Focus state 변경
                   */
//                usernameInFocus.toggle()
//            }
        }
        .padding(40)
        .onAppear {
//            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
//                self.usernameInFocus = true
//            }
        }
    }
}

struct FocusStateExample_Previews: PreviewProvider {
    static var previews: some View {
        FocusStateExample()
    }
}
