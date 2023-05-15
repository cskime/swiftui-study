//
//  ShapeExample.swift
//  SwiftUIViewer
//
//  Created by chamsol kim on 2023/05/16.
//

import SwiftUI

struct ShapeExample: View {
    var body: some View {
        /* 다양한 shape이 있고, 비슷한 modifier를 사용해서 custom 한다.*/
        
//        Circle()
//        Ellipse()
//        Capsule(style: .circular)   // circular는 corner radius 먹인 것 처럼,
//                                    // continuous는 더 자연스러운 곡선
//        Rectangle()
        RoundedRectangle(cornerRadius: 10)
        
        /* fill, stroke 등은 동시에 쓸 수 없다.*/
        
//            .fill(.indigo)
//            .foregroundColor(.blue)
//            .stroke()
//            .stroke(.red)
//            .stroke(.blue, lineWidth: 30)
//            .stroke(.orange, style: StrokeStyle(lineWidth: 30,
//                                                lineCap: .round,
//                                                lineJoin: .bevel,
//                                                dash: [30]))
//            .trim(from: 0.3, to: 1.0)
//            .stroke(.purple, lineWidth: 10) // circular progress
            .frame(width: 300, height: 200)
    }
}

struct ShapeExample_Previews: PreviewProvider {
    static var previews: some View {
        ShapeExample()
    }
}
