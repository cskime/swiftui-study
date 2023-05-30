//
//  ColorPickerExample.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by chamsol kim on 2023/05/30.
//

import SwiftUI

struct ColorPickerExample: View {
    
    @State var backgroundColor = Color.red
    
    var body: some View {
        ZStack {
            backgroundColor.ignoresSafeArea()
            
            ColorPicker("Select a color", selection: $backgroundColor, supportsOpacity: true)
                .padding()
                .background(.black)
                .cornerRadius(10)
                .foregroundColor(.white)
                .font(.headline)
                .padding(50)
        }
    }
}

struct ColorPickerExample_Previews: PreviewProvider {
    static var previews: some View {
        ColorPickerExample()
    }
}
