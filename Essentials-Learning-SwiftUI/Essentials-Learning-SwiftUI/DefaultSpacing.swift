//
//  DefaultSpacing.swift
//  Essentials-Learning-SwiftUI
//
//  Created by chamsol kim on 2023/05/11.
//

import SwiftUI

struct DefaultSpacing: View {
    var body: some View {
        VStack {
            Text("Default Spacing")
            HStack {
                TrainCar(.rear)
                TrainCar(.middle)
                TrainCar(.front)
            }
            TrainTrack()
        }
    }
}

struct DefaultSpacing_Previews: PreviewProvider {
    static var previews: some View {
        DefaultSpacing()
    }
}
