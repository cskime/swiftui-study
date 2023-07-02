//
//  SwiftulThinkingSwiftUIToDoListApp.swift
//  SwiftulThinkingSwiftUIToDoList
//
//  Created by chamsol kim on 2023/06/16.
//

import SwiftUI

/* MVVM Architecture
 - Model : Data point
 - View : UI
 - ViewModel : Manages models for view
 */

@main
struct SwiftulThinkingSwiftUIToDoListApp: App {
    
    /* 앱 전체에서 사용하기 위해 App에서 State로 정의
     */
    @StateObject var listViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            
            /* App 전체에서 Navigation을 사용할 수 있도록 Naviagtion Stack을 여기에서 정의한다.
             */
            NavigationStack {
                ListView()
            }
            /* iOS 16 기준 더 이상 이 modifier를 사용하지 않아도 된다. NavigationStack을 사용하면 iPad에서도 sidebar로 나오지 안흥ㅁ
             * Sidebar로 나오게 하고 싶으면, navigationSplitViewStyle을 사용해야 한다.
             */
//            .navigationViewStyle(.stack)
//            .navigationSplitViewStyle(.automatic)
            /* 하위 어떤 View에서도 이 object에 접근할 수 있도록 environment object로 등록한다.
             */
            .environmentObject(listViewModel)
        }
    }
}
