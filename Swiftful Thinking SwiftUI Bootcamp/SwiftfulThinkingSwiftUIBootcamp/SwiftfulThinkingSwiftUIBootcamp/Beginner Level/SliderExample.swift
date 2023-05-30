//
//  SliderExample.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by chamsol kim on 2023/05/30.
//

import SwiftUI

struct SliderExample: View {
    
    /* BinaryFloatingPoint type */
    @State var sliderValue: Double = 3  // slider의 초기값이 된다.
    
    @State var color = Color.red
    
    var body: some View {
        VStack {
            Text("Rating:")
            Text(
                String(format: "%.2f", arguments: [sliderValue])
            )
            .foregroundColor(color)
            
            // 1. 기본 형태
            Slider(value: $sliderValue)
                .tint(.red)  // accent color
            
            // 2. Slider 범위 지정하기
            Slider(value: $sliderValue, in: 1...10)
                .tint(.green)
            
            // 3. Step amount 지정하기
            Slider(value: $sliderValue, in: 1...10, step: 0.5)
            
            // 4. Full format
            Slider(
                value: $sliderValue,
                in: 1...10,
                step: 0.5,
                label: { Text("Slider") },
                minimumValueLabel: {
                    // slider 왼쪽에 최솟값 표시
                    // customizing 가능
                    Text("1")
                        .font(.largeTitle)
                        .foregroundColor(.orange)
                },
                maximumValueLabel: { Text("5") },   // slider 오른쪽에 최댓값 표시
                onEditingChanged: { begins in
                    // slider value 변경될 때 마다 호출
                    // begins는 value가 변경될 때 true, 터치를 놓으면 false
                    color = begins ? .green : .red
                }
            )
            .padding(.horizontal)
        }
    }
}

struct SliderExample_Previews: PreviewProvider {
    static var previews: some View {
        SliderExample()
    }
}
