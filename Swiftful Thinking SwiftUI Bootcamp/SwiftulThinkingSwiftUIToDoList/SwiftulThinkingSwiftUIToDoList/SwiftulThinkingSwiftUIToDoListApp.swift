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
    var body: some Scene {
        WindowGroup {
            
            /* App 전체에서 Navigation을 사용할 수 있도록 Naviagtion Stack을 여기에서 정의한다.
             */
            NavigationStack {
                ListView()
            }
        }
    }
}
