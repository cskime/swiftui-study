//
//  GradientExample.swift
//  SwiftUIViewer
//
//  Created by chamsol kim on 2023/05/16.
//

import SwiftUI

struct GradientExample: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(
//                .red
//                LinearGradient(
//                    gradient: Gradient(colors: [.red, .blue]),
//                    startPoint: .topLeading,
//                    endPoint: .bottom
//                )
//                RadialGradient(
//                    gradient: Gradient(colors: [.red, .blue]),
//                    center: .leading,
//                    startRadius: 5,
//                    endRadius: 400
//                )
                AngularGradient(
                    gradient: Gradient(colors: [.red, .blue]),
                    center: .topLeading,
                    angle: .degrees(180 + 45)
                )
            )
            .frame(width: 300, height: 200)
    }
}

struct GradientExample_Previews: PreviewProvider {
    static var previews: some View {
        GradientExample()
    }
}
