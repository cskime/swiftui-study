//
//  GroupBootcamp.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by chamsol kim on 2023/06/11.
//

import SwiftUI

/* Group
 * - Stack과 비슷한 개념, layout읇 변경하지 않고 여러 View들을 하나로 묶어준다.
 * - 여러 View들에 modifier을 한 번에 적용할 때 사용한다.
 */
struct GroupBootcamp: View {
    var body: some View {
        VStack(spacing: 50) {
            Text("Hello World!")
            
            /* VStack을 중첩해서 사용해도 되지만 불필요함
             * 이미 content들이 spaciung 50인 상위 VStack에 포함되어 있다.
             */
//            VStack(spacing: 50) {
//                Text("Hello World!")
//                Text("Hello World!")
//            }
//            .font(.caption)
//            .foregroundColor(.green)
            
            /* 새 Stack을 만들지 않고 단순히 View들을 하나로 묶어준다 (groupping)
             */
            Group {
                Text("Hello World!")
                Text("Hello World!")
            }
            .font(.caption)
            .foregroundColor(.green)
        }
        .foregroundColor(.red)
        .font(.headline)
    }
}

struct GroupBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        GroupBootcamp()
    }
}
