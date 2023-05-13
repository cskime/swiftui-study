//
//  AddingSpacer.swift
//  Essentials-Learning-SwiftUI
//
//  Created by chamsol kim on 2023/05/14.
//

import SwiftUI

struct AddingSpacer: View {
    var body: some View {
        VStack {
            Text("Specific Spacing")
                .padding([.bottom])
            HStack(spacing: 20) {
                /*
                 - Color는 background에 색상 shape을 추가하는 개념.
                 - Landscpae orientation에서는 safe area에 의해 image가 완전히 화면 끝으로 붙지는 않는다.
                   이 때, image는 safe area를 넘지 않도록 위치가 조정되지만 background에 추가된 color는
                   safe area를 무시하고 그려진다.
                 */
                TrainCar(.rear)
//                Spacer()
                ZStack {
                    TrainCar(.middle)
                        .font(.largeTitle)
                        .opacity(0)
                        .background(.blue)
                    TrainCar(.middle)
                }
//                Spacer()
                TrainCar(.front)
            }
            TrainTrack()
        }
    }
}

struct AddingSpacer_Previews: PreviewProvider {
    static var previews: some View {
        AddingSpacer()
    }
}
