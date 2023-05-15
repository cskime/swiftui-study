//
//  SpecificSpacing.swift
//  Essentials-Learning-SwiftUI
//
//  Created by chamsol kim on 2023/05/13.
//

import SwiftUI

struct SpecificSpacing: View {
    @ScaledMetric var trainCarSpace = 5
    var body: some View {
        VStack {
            Text("Specific Spacing")
            HStack(spacing: 20) {
                TrainCar(.rear)
                TrainCar(.middle)
//                    .padding([.leading])
//                    .padding(5)
//                    .background(.blue)
                TrainCar(.front)
            }
            .padding()
            .background(.blue)
            TrainTrack()
        }
    }
}

struct SpecificSpacing_Previews: PreviewProvider {
    static var previews: some View {
        SpecificSpacing()
    }
}
