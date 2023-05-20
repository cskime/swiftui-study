//
//  TernaryExample.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by chamsol kim on 2023/05/21.
//

import SwiftUI

struct TernaryExample: View {
    
    @State var isStartingState = false
    
    var body: some View {
        VStack {
            Button("Button : \(isStartingState.description)") {
                isStartingState.toggle()
            }
            
            /* RoundedRectangle을 따로 만들 수도 있지만,
             * 같은 모양에 색상만 바뀌므로 color만 바꾸도록 만드는게 더 좋을 것
             */
            
            Text(isStartingState ? "Starting State" : "Ending State")
            
            RoundedRectangle(cornerRadius: isStartingState ? 25 : 0)
                .fill(isStartingState ? .red : .blue)
                .frame(
                    width: isStartingState ? 200 : 50,
                    height: isStartingState ? 400 : 50
                )
            
//            if isStartingState {
//                RoundedRectangle(cornerRadius: 25)
//                    .fill(.red)
//                    .frame(width: 200, height: 100)
//            } else {
//                RoundedRectangle(cornerRadius: 25)
//                    .fill(.blue)
//                    .frame(width: 200, height: 100)
//            }
            
            Spacer()
        }
    }
}

struct TernaryExample_Previews: PreviewProvider {
    static var previews: some View {
        TernaryExample()
    }
}
