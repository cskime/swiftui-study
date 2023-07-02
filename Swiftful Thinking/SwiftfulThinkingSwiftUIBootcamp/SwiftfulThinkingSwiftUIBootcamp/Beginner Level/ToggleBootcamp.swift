//
//  ToggleBootcamp.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by chamsol kim on 2023/05/29.
//

import SwiftUI

struct ToggleBootcamp: View {
    
    @State var toggleIsOn = false
    
    var body: some View {
        VStack {
            HStack {
                Text("Status :")
                Text(toggleIsOn ? "Online" : "Offline")
            }
            .font(.title)
            
            Toggle(isOn: $toggleIsOn) {
                Text("Change status")
            }
    //        .toggleStyle(.button)  // 버튼 토글 방식
    //        .toggleStyle(.switch)  // UISwitch 방식
            .toggleStyle(SwitchToggleStyle(tint: .red))  // On 상태 색상 바꾸기
            
            Spacer()
        }
        .padding(.horizontal, 100)
    }
}

struct ToggleBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ToggleBootcamp()
    }
}
