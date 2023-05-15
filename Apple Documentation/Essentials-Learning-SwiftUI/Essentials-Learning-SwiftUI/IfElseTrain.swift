//
//  IfElseTrain.swift
//  Essentials-Learning-SwiftUI
//
//  Created by chamsol kim on 2023/04/30.
//

import SwiftUI

struct IfElseTrain: View {
    let longerTrain: Bool
    
    let reservesSpaceWhenDisappears: Bool
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "train.side.rear.car")
                if longerTrain {
                    Image(systemName: "train.side.middle.car")
                } else if reservesSpaceWhenDisappears {
                    Image(systemName: "train.side.middle.car")
                        .opacity(longerTrain ? 1 : 0)
                }
                Image(systemName: "train.side.front.car")
            }
            Divider()
        }
        
    }
}

struct IfElseTrain_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 16) {
            IfElseTrain(longerTrain: true, reservesSpaceWhenDisappears: true)
            IfElseTrain(longerTrain: false, reservesSpaceWhenDisappears: true)
            IfElseTrain(longerTrain: false, reservesSpaceWhenDisappears: false)
        }
    }
}
