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
            /* 하위 어떤 View에서도 이 object에 접근할 수 있도록 environment object로 등록한다.
             */
            .environmentObject(listViewModel)
        }
    }
}
