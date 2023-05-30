//
//  DarkModeExample.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by chamsol kim on 2023/05/30.
//

import SwiftUI

struct DarkModeExample: View {
    
    /* Default environment : Light/Dark 설정값을 가지고 있다.
     */
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    
                    /* Dark mode를 지원할 때 색상을 사용하려면 adaptability를 신경써야 함
                     */
                    
                    Text("This text is PRIMARY")
                        .foregroundColor(.primary)      // light에서 black, dark에서 white
                    Text("This text is SECONDARY")
                        .foregroundColor(.secondary)    // light, dark 모드에 따라 바뀜
                    Text("This text is BLACK")
                        .foregroundColor(.black)        // theme에 따라 바뀌지 않음
                    Text("This text is WHITE")
                        .foregroundColor(.white)        // theme에 따라 바뀌지 않음
                    Text("This text is RED")
                        .foregroundColor(.red)          // theme에 따라 바뀌지 않음
                    Text("This text is globally adaptive!")
                        // Assets.xcassets에서 adaptive custom color를 설정해서 사용
                        .foregroundColor(Color("AdaptiveColor"))
                    Text("This text is locally adaptive!")
                        /* View마다 가지고 있는 `colorScheme` environment를 사용해서
                         * theme에 따라 다른 색상을 사용한다.
                         */
                        .foregroundColor(colorScheme == .light ? .green : .yellow)
                }
            }
            .navigationTitle("Dark Mode Bootcamp")
        }
    }
}

struct DarkModeExample_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DarkModeExample()
                .preferredColorScheme(.dark)
            DarkModeExample()
                .preferredColorScheme(.light)
        }
    }
}
