//
//  SheetsExample.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by chamsol kim on 2023/05/22.
//

import SwiftUI

struct SheetsExample: View {
    
    /* Sheet를 보여주기 위해 상태를 저장하는 @State property가 필요하다.
     */
    @State var showSheet = false
    
    var body: some View {
        ZStack {
            Color.green
                .ignoresSafeArea()
            
            Button {
                showSheet.toggle()
            } label: {
                Text("Button")
                    .foregroundColor(.green)
                    .font(.headline)
                    .padding(20)
                    .background(Color.white.cornerRadius(10))
            }
            /* Sheet를 보여주는 방법
             * Binding을 전달해야 하므로 $을 사용해야 함
             * Sheet는 view마다 하나씩만 사용해야 한다.
             * Sheet의 content 안에서는 if-else같은 conditional logic을 넣지 말아야 한다.
             * Sheet는 항상 하나의 view만 보여줘야 한다.
             * Conditional logic으로 두 개의 view를 다르게 반환하려고 해도, view가 load되는 시점에 어떤 view를
             * sheet로 보여줄지 정해지므로, condition이 바뀌어도 sheet는 항상 같은 view를 보여줄 것이다.
             * (할 수는 있지만 나중에...)
             */
//            .sheet(isPresented: $showSheet) {
//                // Sheet로 보여줄 화면
//                Text("HELLO THERE!!!!")   // 가운데 Text만 있는 화면이 sheet로 표시됨
//
//                // DO NOT ADD CONDITIONAL LOGIC *********
//                SecondScreen()
//            }
            
            /* Full screen으로 보여주는 방법
             * onDismiss는 full screen으로 보여준 view가 dismiss되면 실행된다.
             * sheet나 fullScreenCover는 둘 중 하나만 사용해야 한다.
             */
            .fullScreenCover(isPresented: $showSheet) {
                print("Dismissed")
            } content: {
                SecondScreen()
            }
        }
    }
}

struct SecondScreen: View {
    
    /* Environment Variable
     * - A property wrapper that reads a value from a view’s environment.
     * - View 계층을 따라 생성되는 환경변수 같은 것
     * - environment(_:_:)로 등록하고, @Environment(\.something)으로 꺼내씀
     */
    
    /* @Environment(_:)에는 keyPath로 EnvironmentValues를 넣는데, presentationMode는 iOS 15에서 deprecated 되었다.
     * iOS 15부터는 isPresented와 dismiss를 사용해야 한다.
     * 여기서는 sheet로 띄운 SecondScreen을 dismiss할 것이므로 `dismiss`를 사용한다.
     * 이 environment variable은 함수처럼 `()`을 붙여서 실행시킨다.
     */
//    @Environment(\.presentationMode) var presentationMode
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Color.red
                .ignoresSafeArea()
            
            Button {
                /* Sheet는 드래그해서 닫을 수도 있지만 버튼을 클릭해서 닫게 만들 수도 있따.
                 * iOS 14까지는 `.presentationMode`의 wrappedValue로부터 `dismiss()`를 호출했지만
                 * iOS 15부터는 `.dismiss` action을 직접 사용해서 호출한다.
                 */
//                presentationMode.wrappedValue.dismiss()
                dismiss()
            } label: {
                Image(systemName: "xmark")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .padding(20)
            }
        }
    }
}

struct SheetsExample_Previews: PreviewProvider {
    static var previews: some View {
        SheetsExample()
    }
}
