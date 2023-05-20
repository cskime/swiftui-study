//
//  ExtractSubviewsExample.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by chamsol kim on 2023/05/20.
//

import SwiftUI

struct ExtractSubviewsExample: View {
    var body: some View {
        ZStack {
            Color.mint
                .ignoresSafeArea()
            
            /* Property로 추출한 것 */
//            myItem
            
            /* Subview로 추출한 것
             * 같은 모양을 dynamic value만 바꿔서 재사용할 수 있다.
             */
//            HStack {
//                MyView(title: "Apples", count: 1, color: .red)
//                MyView(title: "Oranges", count: 10, color: .orange)
//                MyView(title: "Bananas", count: 34, color: .yellow)
//            }
            
            /* 이걸 또 property로 추출할 수도 있음 */
            contentLayer
        }
    }
    
    var contentLayer: some View {
        HStack {
            MyView(title: "Apples", count: 1, color: .red)
            MyView(title: "Oranges", count: 10, color: .orange)
            MyView(title: "Bananas", count: 34, color: .yellow)
        }
    }
    
    /* View를 property로 추출한 것
     */
    var myItem: some View {
        VStack {
            Text("1")
            Text("Apples")
        }
        .padding()
        .background(.red)
        .cornerRadius(10)
    }
}


/* Text나 color가 dynamic한 View를 만들고 싶다면 Subview로 추출한다.
 * 그러면 생성자를 통해 dynamic value를 전달할 수 있음
 */

struct MyView: View {
    
    let title: String
    let count: Int
    let color: Color
    
    var body: some View {
        VStack {
            Text("\(count)")
            Text(title)
        }
        .padding()
        .background(color)
        .cornerRadius(10)
    }
}

struct ExtractSubviewsExample_Previews: PreviewProvider {
    static var previews: some View {
        ExtractSubviewsExample()
    }
}
