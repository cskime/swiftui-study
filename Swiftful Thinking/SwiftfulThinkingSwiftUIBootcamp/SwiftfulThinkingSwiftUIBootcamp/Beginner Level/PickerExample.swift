//
//  PickerExample.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by chamsol kim on 2023/05/29.
//

import SwiftUI

struct PickerExample: View {
    
    @State var selection = "Most Liked"
    let filterOptions: [String] = [
        "Most Recent", "Most Popular", "Most Liked"
    ]
    
    var body: some View {
        VStack {
            HStack {
                Text("Age :")
                Text(selection)
            }
            
            Picker(
                /* Selection에 binding한 property에는 tag에 지정해 둔 unique 값이 저장된다.
                 * tag를 지정하지 않으면 content 값이 저장된다.
                 */
                selection: $selection,
                content: {
                    ForEach(18..<100) { number in
                        let stringValue = String(number)
                        Text(stringValue)
                            .font(.title)
                            .foregroundColor(.red)
                            .tag(stringValue)
                    }
                },
                label: {
                    Text("Picker")
                }
            )
            /* 강의에선 기본 style이 wheel이지만, iOS 16 기준 menu가 기본 style로 사용된다.
             * Options : wheel, menu, segmented, inline
             */
            .pickerStyle(.wheel)
            
            Picker(
                selection: $selection,
                content: {
                    ForEach(filterOptions, id: \.self) { option in
                        HStack {
                            Text(option)
                            Image(systemName: "heart.fill")
                        }
                        .tag(option)
                    }
                },
                label: {
                    HStack {
                        Text("Filter :")
                        Text(selection)
                    }
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .padding(.horizontal)
                    .background(.blue)
                    .cornerRadius(10)
                    .shadow(color: Color.blue.opacity(0.3), radius: 10, x: 0, y: 20)
                }
            )
            //            .pickerStyle(.menu)
            .pickerStyle(.menu)
            
            Picker(
                selection: $selection,
                content: {
                    ForEach(filterOptions.indices) { index in
                        Text(filterOptions[index])
                            .tag(filterOptions[index])
                    }
                },
                label: {
                    Text("Picker")
                }
            )
            .pickerStyle(.segmented)  // UISegmentedControl과 같다.
            .background(.red)
        }
    }
    
    init() {
        /* Segmented picker style은 UISegmentedControl로부터 온 것이므로
         * UISegmentedControl.appearance()를 사용해서 앱 전체에서 사용하는 모든 segmented control을 커스터마이징 할 수 있다.
         */
        UISegmentedControl.appearance().selectedSegmentTintColor = .blue
        
        UISegmentedControl.appearance().setTitleTextAttributes(
            [.foregroundColor: UIColor.white],
            for: .selected 
        )
    }
}

struct PickerExample_Previews: PreviewProvider {
    static var previews: some View {
        PickerExample()
    }
}
