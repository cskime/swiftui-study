//
//  TapGestureExample.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by chamsol kim on 2023/05/31.
//

import SwiftUI

struct TapGestureExample: View {
    
    @State var isSelected = false
    
    var body: some View {
        VStack(spacing: 40) {
            
            RoundedRectangle(cornerRadius: 25)
                .frame(height: 200)
                .foregroundColor(isSelected ? .green : .red)
            
            Button {
                isSelected.toggle()
            } label: {
                Text("Button")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(.blue)
                    .cornerRadius(25)
            }
            
            /* Button이 없어도 tap 기능을 사용할 수 있게 해 준다.
             * 단, Button은 누르면 highlight state를 사용할 수 있지만, tap gesture는 highlight 상태가 없다.
             *
             * Button보다 만들기 쉬워서 onTapGesture를 대신 많이 사용하곤 한다.
             * 단, gesture는 highlight 상태가 없데이트 되지 않음.
             */
            Text("Tap Geustre")
                .font(.headline)
                .foregroundColor(.white)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(.blue)
                .cornerRadius(25)
                // 1. 평범한 tap gesture
//                .onTapGesture {
//                    isSelected.toggle()
//                }
            
                // 2. 더블탭 등 tap이 두 개 나타날 때 호출
                .onTapGesture(count: 2) {
                    isSelected.toggle()
                }
            
            Spacer()
        }
        .padding(40)
    }
}

struct TapGestureExample_Previews: PreviewProvider {
    static var previews: some View {
        TapGestureExample()
    }
}
