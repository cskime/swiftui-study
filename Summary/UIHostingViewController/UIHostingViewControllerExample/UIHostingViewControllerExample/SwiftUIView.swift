//
//  SwiftUIView.swift
//  UIHostingViewControllerExample
//
//  Created by chamsol kim on 2023/07/01.
//

import SwiftUI

struct SwiftUIView: View {
    
    @ObservedObject var observable: ObservableData
    
    var body: some View {
        ZStack {
            Color.blue
            Button("Hello, World!\nThis is SwiftUI View!") {
                observable.data = "From SwiftUI View"
                observable.action?()
            }
            .multilineTextAlignment(.center)
            .background(.green)
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView(observable: ObservableData())
    }
}
