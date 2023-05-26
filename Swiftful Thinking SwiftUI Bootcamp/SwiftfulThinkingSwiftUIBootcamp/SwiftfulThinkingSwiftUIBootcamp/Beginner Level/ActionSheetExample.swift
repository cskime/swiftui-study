//
//  ActionSheetExample.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by chamsol kim on 2023/05/27.
//

import SwiftUI

struct ActionSheetExample: View {
    var body: some View {
        Example1()
        Example2()
    }
}

extension ActionSheetExample {
    
    struct Example2: View {
        
        @State var showActionSheet = false
        @State var actionSheetOption: ActionSheetOptions = .otherPost
        
        enum ActionSheetOptions {
            case myPost
            case otherPost
        }
        
        var body: some View {
            VStack {
                HStack {
                    Circle()
                        .frame(width: 30, height: 30)
                    Text("@username")
                    Spacer()
                    Button {
                        actionSheetOption = .otherPost
                        showActionSheet.toggle()
                    } label: {
                        Image(systemName: "ellipsis")
                    }
                }
                .padding(.horizontal)
                
                Rectangle()
                    /* 너비:높이 비율
                     * 1보다 크면 너비가 더 큼
                     * 1보다 작으면 높이가 더 큼
                     * 정사각형 만들려면 contentMode를 .fit으로. 비율에 맞춰 크기가 줄어든다.
                     */
                    .aspectRatio(1, contentMode: .fit)
            }
            .confirmationDialog(
                Text("This is the title."),
                isPresented: $showActionSheet,
                titleVisibility: .visible
            ) {
                /* 버튼 순서
                 * 1. cancel role button은 항상 맨 아래에 분리되어 표시된다.
                 * 2. 다른 버튼들은 여기에 추가한 순서대로 action sheet에 표시된다.
                 */
//                Button("Default") {}
//                Button("Cancel", role: .cancel) {}
//                Button("Default") {}
//                Button("Default") {}
//                Button("Destructive", role: .destructive) {}
//                Button("Default") {}
//                Button("Default") {}
                
                Button("Share") {}
                if actionSheetOption == .myPost {
                    Button("Delete", role: .destructive) {}
                }
                Button("Report", role: .destructive) {}
                Button("Cancel", role: .cancel) {}

            } message: {
                Text("This is the message.")
            }
        }
    }
    
    struct Example1: View {
        
        @State var showActionSheet = false
        
        var body: some View {
            Button("Click me") {
                showActionSheet.toggle()
            }
            /* actionSheet(isPresented:content:)는 iOS 15에서 deprecated 되었다.
             * confirmationDialog를 사용해야 한다.
             */
            .actionSheet(isPresented: $showActionSheet) {
    //            ActionSheet(title: Text("This is the title!"))
                ActionSheet(
                    title: Text("This is the title!"),
                    message: Text("This is the message."),
                    buttons: [
    //                    .cancel(),
                        .cancel(Text("Cancel Button")),
                        .default(Text("Default Button")),
                        .destructive(Text("Destructive Button"))
                    ]
                )
            }
            
            /* confirmationDialog(_:isPresented:titleVisibility:actions:) 사용
             */
    //        .confirmationDialog(
    //            Text("This is the title!!"),
    //            isPresented: $showActionSheet,
    //            titleVisibility: .visible
    //        ) {
    //            Button(role: .cancel) {
    //
    //            } label: {
    //                Text("Cancel")
    //            }
    //
    //            Button(role: .destructive) {
    //
    //            } label: {
    //                Text("Close")
    //            }
    //
    //            Button("Default") {
    //
    //            }
    //
    //            Button {
    //
    //            } label: {
    //                /* Modifier 동작하지 않음
    //                 */
    //                Text("Custom")
    //                    .font(.largeTitle)
    //                    .foregroundColor(.green)
    //            }
    //
    //        } message: {
    //            Text("This is the message!!")
    //        }
        }
    }
}

struct ActionSheetExample_Previews: PreviewProvider {
    static var previews: some View {
        ActionSheetExample()
    }
}
