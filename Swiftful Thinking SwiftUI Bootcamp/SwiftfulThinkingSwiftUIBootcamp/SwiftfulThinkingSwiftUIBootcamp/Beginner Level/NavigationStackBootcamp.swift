//
//  NavigationStackBootcamp.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by chamsol kim on 2023/06/07.
//

import SwiftUI

/* NavigationView는 A -> B Push Forward only
 * NavigationStack은 여러 개 screen을 동시에 넘길 수 있다.
 * NavigationStack은 lazy loading secondary screen에 있다.
 */

/* 정리
 * Lazy NavigationLink
 * Push multiple screen at the same time
 */
    
struct NavigationStackBootcamp: View {
    
    let fruits = ["Apple", "Orange", "Banana"]
    
    /* Stack Path를 미리 초기화 해 두면 navigation stack에서
     * path의 마지막 value를 사용한 screen으로 미리 push된 상태로 실행된다.
     */
    @State private var stackPath: [String] = ["One", "Two", "Three"]
    
    var body: some View {
        
        /* Path : Int, String 등 어떤 화면에 사용하는 destination value를 의미한다.\
         * NavigationStack(path:root:)를 사용하면, root 안에서는 모두 동일한 path를 사용해야 한다.
         * Path는 Hashable 해야 한다.
         */
        NavigationStack(path: $stackPath) {
        
//        NavigationStack {
            ScrollView {
                VStack(spacing: 40) {
                    
                    Button("Super segue!") {
//                        stackPath.append("Coconut") // "Coconut"이란 값을 사용해서 push하게 된다.
                        
                        /* Multiple Screen을 동시에 넘길 수 있다.
                         * 여기서는 "Mango"란 value를 사용해서 push
                         * Back button을 누르면 Watermelon, Coconut을 차례대로 나와야 한다.
                         */
                        stackPath.append(contentsOf: ["Coconut", "Watermelon", "Mango"])
                    }
                    
                    /* Working with multiple data types: 둘 이상의 값을 NavigationLink로 전달하는 방법
                     *
                     * init(value:label:)로 전달하는 value를 사용해서 destination에 전달하려면
                     * 아래에서 .navigationDestination(for:destination:) modifier를 추가하고 for에 value type을 지정해야 함
                     * 이 value type이 맞지 않으면 destination이 호출되지 않는다.
                     * .navigationDestination(for:destination:) modifier는 사용하는 값에 따라 여러 개 붙일 수 있다.
                     */
                    ForEach(fruits, id: \.self) { fruit in
                        NavigationLink(value: fruit) {
                            Text(fruit)
                        }
                    }
                    
                    ForEach(0..<10) { x in
                        /* 아직 destination으로 넘어가지 않았는데 초기화는 미리 되어있다.
                         * NavigationLink를 10개 만들면 10개 View가 미리 초기화되어 있다.
                         * Download, Loading 등 동작이 있다면 성능에 영향을 줄 수 있다.
                         * 이런 문제가 발생하는 이유는 NavigationLink가 lazy하지 않기 때문
                         */
//                        NavigationLink {
//                            MySecondScreen(value: x)
//                        } label: {
//                            Text("Click me: \(x)")
//                        }
                        
                        
                        /* Lazy NavigationLink를 사용하려면 init(value:label:)을 사용한다.
                         * Value에 넣은 값이 아래에서 navigationDestination(for:hashable:)에 넣었던 for의 타입과 같아야 하고
                         * 그 값이 Hashable closure 에 값으로 전달된다.
                         * 기존에 사용하던 init(destination:label:)에서 destination이 분리된 것
                         */
                        NavigationLink(value: x) {
                            Text("Click me: \(x)")
                        }
                    }
                }
            }
            .navigationTitle("Nav Bootcamp")
            /* 실제로 이동하는 screen만 load하기 위해 NavigationLink
             */
            .navigationDestination(for: Int.self) { selectedValue in
                MySecondScreen(value: selectedValue)
            }
            .navigationDestination(for: String.self) { value in
                Text("Another Screen : \(value)")
            }
        }
    }
}

struct MySecondScreen: View {
    
    let value: Int
    
    init(value: Int) {
        self.value = value
        print("INIT SCREEN: \(value)")
    }
    
    var body: some View {
        Text("Screen \(value)")
    }
}

struct NavigationStackBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStackBootcamp()
    }
}
