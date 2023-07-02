//
//  BadgesExample.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by chamsol kim on 2023/06/01.
//

import SwiftUI

/* badge는 list rows and tab bars에만 보인다.
 * - List
 * - TabView
 */

struct BadgesExample: View {
    var body: some View {
//        TabView {
//            Color.red
//                .tabItem {
//                    Image(systemName: "heart.fill")
//                    Text("Hello")
//                }
//                .badge(5)
//
//            Color.green
//                .tabItem {
//                    Image(systemName: "heart.fill")
//                    Text("Hello")
//                }
//                /* Text를 사용할 수도 있다. */
//                .badge("NEW")
//
//            Color.blue
//                .tabItem {
//                    Image(systemName: "heart.fill")
//                    Text("Hello")
//                }
//                /* count가 0이면 badge가 보이지 않음*/
//                .badge(0)
//        }
        
        List {
            // list row에서 badge 사용
            Text("Hello, World!")
                .badge("NEW ITEMS!")
            
            /* List view에서는 custom label로 커스터마이징 할 수도 있다.
             * 단, background는 바꾸지 못한다. StringProtocol을 채택한 View만 가능하다.
             */
            Text("Hello, World!")
                .badge(
                    Text("NEW ITEMS!")
                        .font(.title)
                        .foregroundColor(.red)
//                        .background(.blue)
                )
            Text("Hello, World!")
            Text("Hello, World!")
        }
    }
}

struct BadgesExample_Previews: PreviewProvider {
    static var previews: some View {
        BadgesExample()
    }
}
