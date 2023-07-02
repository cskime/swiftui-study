//
//  ConditionalExample.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by chamsol kim on 2023/05/20.
//

import SwiftUI

struct ConditionalExample: View {
    
    @State var showCircle = false
    @State var showRectangle = false
    @State var isLoading = false
    
    var body: some View {
        VStack(spacing: 20) {
            
            Button("Circle Button: \(showCircle.description)") {
                showCircle.toggle()
            }
            
            Button("Rectangle Button: \(showRectangle.description)") {
                showRectangle.toggle()
            }
            
            if showCircle {
                Circle()
                    .frame(width: 100, height: 100)
            }
            
            if showRectangle {
                Rectangle()
                    .frame(width: 100, height: 100)
            }
            
            if showCircle && showRectangle {
                RoundedRectangle(cornerRadius: 25)
                    .frame(width: 200, height: 100)
            }
            
            if showCircle || showRectangle {
                Capsule(style: .continuous)
                    .frame(width: 200, height: 100)
            }
            
            /* 오래 걸리는 작업할 때 loading 보여주는 용도로도 사용할 수 있다.
             */
            Button("Is Loading : \(isLoading.description)") {
                isLoading.toggle()
            }
            
            if isLoading {
                ProgressView()
            }
            
            Spacer()
        }
    }
}

struct ConditionalExample_Previews: PreviewProvider {
    static var previews: some View {
        ConditionalExample()
    }
}
