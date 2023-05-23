//
//  NavigationViewExample.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by chamsol kim on 2023/05/24.
//

import SwiftUI

struct NavigationViewExample: View {
    var body: some View {
        
        /* NavigationView는 top에 navigation title을 만들어 주고 navigation transition을 지원함
         * Hierarchy에 1개만 있어야 한다.
         * - iOS 16부터 NavigationStack으로 변경되었다. (NavigationStack or NavigationSplitView)
         * - Navigation title을 달지 않으면 상단에 navigation bar 영역을 미리 잡지 않는다.
         */
//        NavigationView {
        NavigationStack {
            ScrollView {
                Text("Hello, World!")
                Text("Hello, World!")
                Text("Hello, World!")
                
                /* Button과 비슷함
                 * 클릭했을 때 navigation push transition으로 동작
                 * content를 second screen으로 보여준다.
                 */
                NavigationLink("Hello, world!") {
//                    Text("Second Screen")
                    MyOtherScreen()
                }
            }
            .navigationTitle("All Inboxes")                 // Navigation bar title
            /* Navigation bar hidden
             * - iOS 16부터 navigationBarHidden이 deprecated 되었다.
             * - .toolbar(.hidden, for: .navigationBar)를 사용해야 한다.
             */
            .navigationBarTitleDisplayMode(.large)          // Large title or not (inline, large, automatic)
//            .navigationBarHidden(true)                    // Deprecated
//            .toolbar(.hidden, for: .navigationBar)        // from iOS 16.0
            
            /* Navigation bar item
             * - iOS 14.0부터 navigationBarItems가 deprecated 되었다.
             * - .toolbar(content:)를 사용해야 한다.
             * - Multiplatform 대응을 위해 toolbar로 NavigationStack, Tabbar 등에서 사용할 인터페이스를 합쳐 놓았다.
             */
//            .navigationBarItems(                            // Deprecated
//                leading: HStack {
//                    Image(systemName: "person.fill")
//                    Image(systemName: "flame.fill")
//                },
//                trailing: Image(systemName: "gear")
//            )
            .toolbar {
                ToolbarItemGroup(
                    placement: .navigationBarLeading
                ) {
                    Image(systemName: "person.fill")
                    Image(systemName: "flame.fill")
                }
                
                ToolbarItemGroup(
                    placement: .navigationBarTrailing
                ) {
                    /* Navigation bar item을 눌러서 navigation push
                     */
                    NavigationLink {
                        MyOtherScreen()
                    } label: {
                        Image(systemName: "gear")
                    }
                }
//                HStack {
//                    Image(systemName: "person.fill")
//                    Spacer()
//                    Image(systemName: "gear")
//                }
            }
        }
    }
}

struct MyOtherScreen: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            Color.green
                .ignoresSafeArea()
            /* Navigation으로 이동한 화면에서 title 추가
             * NavigationStack(or NavigationView)은 hierarchy에 1개만 존재해야 하고
             * 상위 view에서 NavigationStack을 추가했으므로, 바로 navigation modifier를 사용해도 된다.
             */
                .navigationTitle("Second Screen")
                .toolbar(.hidden, for: .navigationBar)      // default back button까지 없어진다.
            
            VStack {
                /* NavigationStack(or NavigationView) 안에서 dismiss는 navigation pop처럼 동작한다.
                 */
                Button("Back Button") {
                    dismiss()
                }
                
                /* Navigation stack에 view를 연속해서 쌓을 수 있다.
                 */
                NavigationLink("Click here", destination: Text("3rd screen!"))
            }
        }
    }
}

struct NavigationViewExample_Previews: PreviewProvider {
    static var previews: some View {
        NavigationViewExample()
    }
}
