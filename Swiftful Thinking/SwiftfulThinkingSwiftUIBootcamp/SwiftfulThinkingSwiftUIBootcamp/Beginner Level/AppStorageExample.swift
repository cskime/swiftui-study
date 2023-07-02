//
//  AppStorageExample.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by chamsol kim on 2023/06/01.
//

import SwiftUI

struct AppStorageExample: View {
    
//    @State var currentUserName: String?
    
    /* @State 대신 사용
     * 이 값이 바뀌면 View를 업데이트하고, 내부적으로 UserDefaults에 저장한다.
     * App의 어떤 View에서도 같은 key를 사용하여 하나의 값에 접근할 수 있다.
     */
    @AppStorage("name") var currentUserName: String?
    
    var body: some View {
        VStack(spacing: 20) {
            Text(currentUserName ?? "Add Name Here")
            
            if let name = currentUserName {
                Text(name)
            }
            
            Button("SAVE") {
                /* UIKit에서는 UserDefaults를 사용했었다.
                 */
                let name = "Emily"
//                UserDefaults.standard.set(name, forKey: "name")
                currentUserName = name
            }
        }
        /* UserDefaults로부터 값을 가져오는 코드가 필요 없으므로 onAppear는 사용하지 않아도 된다.
         */
//        .onAppear {
//            /* VStack이 화면에 렌더링되면 UserDefaults로부터 저장된 값을 가져와서 초기화한다.
//             */
//            currentUserName = UserDefaults.standard.string(forKey: "name")
//        }
    }
}

struct AppStorageExample_Previews: PreviewProvider {
    static var previews: some View {
        AppStorageExample()
    }
}
