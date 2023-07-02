//
//  ToolbarExample.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by chamsol kim on 2023/06/10.
//

import SwiftUI

struct ToolbarExample: View {
    
    @State private var text = ""
    @State private var paths = [String]()
    
    var body: some View {
        NavigationStack(path: $paths) {
            ZStack {
                Color.indigo.ignoresSafeArea()
                
                ScrollView {
                    TextField("Placeholder", text: $text)
                    
                    ForEach(0..<50) { _ in
                        Rectangle()
                            .frame(width: 200, height: 200)
                    }
                }
            }
            .navigationTitle("Toolbar")
            /* NavigationView를 사용할 때는 navigationBarItems로 좌우 item을 넣었지만 iOS 15 부터는 toolbar를 사용
             * iPhone, iPad, Apple Watch 등 모두 toolbar를 가지고 있음
             * 같은 API를 사용해서 각 device마다 다른 UI로 toolbar를 사용할 수 있게 한다.
             */
//            .navigationBarItems(
//                leading: Image(systemName: "heart.fill"),
//                trailing: Image(systemName: "gear")
//            )
            .toolbar {
                /* Content closure에서 ToolbarItem을 만들어서 사용한다.
                 * ToolBarItem 하나 당 View 1개만 넣어야 한다.
                 * Stack으로 묶으면 여러 개를 하나처럼 넣을 수도 있음
                 */
                ToolbarItem(placement: .navigationBarLeading) {
                    Image(systemName: "heart.fill")
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image(systemName: "gear")
                }
                
                ToolbarItem(placement: .bottomBar) {
                    // 왼쪽 아래에 toolbar 버튼 추가하기
                    Image(systemName: "gear")
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                
                ToolbarItem(placement: .keyboard) {
                    // 키보드가 나타날 때 toolbar에 추가하기
                    Image(systemName: "gear")
                }
            }
//            .navigationBarHidden(true)    // deprecated
//            .toolbar(.hidden, for: .navigationBar)
            
            /* Scroll하면서 navigation bar에 background blur 처리를 없앤다.
             */
//            .toolbarBackground(.hidden, for: .navigationBar)
            
            /* Navigation bar의 color scheme 변경
             * Navigation bar를 dark mode에서 사용하는 것 처럼 바꾼다.
             */
//            .toolbarColorScheme(.dark, for: .navigationBar)
            
            /* .inline으로 설정하면 Navigation bar title이 작게 표시된다.
             * .large면 큰 title
             */
            .navigationBarTitleDisplayMode(.inline)
            
            /* .toolbarTitleMenu modifier를 달면 navigation title에 버튼이 생긴다.
             * Content에 추가한 view들이 context button들로 표시된다.
             */
            .toolbarTitleMenu {
                Button("Screen 1") {
                    /* NavigationStack에서 임의의 화면으로 이동하는 방법
                     * 아래 .navigationDestination(for:destination:) modifier와 함께 동작함
                     * 'value'에 String type을 넣었으므로, path에 String type을 추가하면
                     * NavigationStack이 값을 감지해서 .navigationDestination modifier의 destination closure로
                     * 값을 전달하고 View를 반환한다.
                     */
                    paths.append("Screen 1")
                }
                
                Button("Screen 2") {
                    paths.append("Screen 2")
                }
            }
            .navigationDestination(for: String.self) { value in
                Text("New screen: \(value)")
            }
        }
    }
}

struct ToolbarExample_Previews: PreviewProvider {
    static var previews: some View {
        ToolbarExample()
    }
}
