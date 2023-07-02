//
//  ResizableSheetBootcamp.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by chamsol kim on 2023/06/10.
//

import SwiftUI

struct ResizableSheetBootcamp: View {
    
    @State private var showSheet = false
    @State private var detents: PresentationDetent = .large
    
    var body: some View {
        Button("Click me!") {
            showSheet.toggle()
        }
        .sheet(isPresented: $showSheet) {
            /* 기존에 사용하던 sheet modifier를 수정할 필요 없음. Content에 presentationDetents modifier만 추가하면 된다.
             * iPhone에서는 sheet가 멈추는 곳을 조절할 수 있다. medium은 sheet가 중간까지만 오게 만든다.
             * PresentationDetent 값이 두 개 이상인 경우, 상단 handle이 생기고 지정한 size로 바꿀 수 있게 된다.
             */
            MyNextView(detents: $detents)
//                .presentationDetents([
//                    .medium,            // 화면 중간까지 올라가는 sheet
//                    .large,             // 화면 끝까지 올라가는 sheet
//                    .fraction(0.1),     // Percentage of screen
//                    .height(200),       // 고정 위치로 올라가는 sheet. 화면 크기에 따라 다르므로 안전하지 않을 수 있음
////                    .custom(CustomPresentationDetent.Protocol)        // Sheet가 나타나는 애니메이션을 직접 만들 수도 있다.
//                ])
                .presentationDragIndicator(.hidden) // Detent가 둘 이상일 때 상단 handle 숨기기
                .interactiveDismissDisabled()       // Sheet를 drag로 닫지 못하게 만든다.
        }
    }
}

struct MyNextView: View {
    
    @Binding var detents: PresentationDetent
    
    var body: some View {
        ZStack {
            Color.red.ignoresSafeArea()
            
            VStack {
                Button("20%") {
                    detents = .fraction(0.2)
                }
                
                Button("MEDIUM") {
                    detents = .medium
                }
                
                Button("600px") {
                    detents = .height(600)
                }
                
                Button("MEDIUM") {
                    detents = .large
                }
            }
        }
        /* Change sheet size by programatically update detents
         * Detents를 바꿀 때는 설정해 둔 detent로만 변경 가능하다.
         */
        .presentationDetents([.fraction(0.2), .medium, .height(600), .large], selection: $detents)
    }
}

struct ResizableSheetBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ResizableSheetBootcamp()
    }
}
