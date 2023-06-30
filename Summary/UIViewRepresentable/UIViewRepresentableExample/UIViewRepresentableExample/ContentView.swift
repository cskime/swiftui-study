//
//  ContentView.swift
//  UIViewRepresentableExample
//
//  Created by chamsol kim on 2023/06/30.
//

import SwiftUI

struct ContentView: View {
    
    @State private var text = "0"
    @State private var foregroundColor = Color.black
    
    var body: some View {
        VStack {
            Text(text)
            UIKitButton("Plus One") {
                print("Button Touched")
                guard var integer = Int(text) else { return }
                integer += 1
                text = String(integer)
            }
            .titleColor(foregroundColor)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
