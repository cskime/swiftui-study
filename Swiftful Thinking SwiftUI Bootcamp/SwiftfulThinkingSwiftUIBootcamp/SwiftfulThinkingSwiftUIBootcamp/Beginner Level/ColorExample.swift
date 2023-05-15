//
//  ColorExample.swift
//  SwiftUIViewer
//
//  Created by chamsol kim on 2023/05/16.
//

import SwiftUI

struct ColorExample: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(
//                .red          // preset
//                .primary      // light -> black, dark -> white
//                .secondary
//                Color(UIColor.systemGray3)   // Use system color from UIKit color
                Color("CustomColor")    // from xcassets
            )
            .frame(width: 200, height: 200)
//            .shadow(radius: 10)
            .shadow(
                color: Color("CustomColor").opacity(0.3),
                radius: 10,
                x: -20,
                y: -20
            )
    }
}

struct ColorExample_Previews: PreviewProvider {
    static var previews: some View {
        ColorExample()
    }
}
