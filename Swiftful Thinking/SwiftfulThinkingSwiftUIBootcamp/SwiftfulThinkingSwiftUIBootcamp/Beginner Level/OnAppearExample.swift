//
//  OnAppearExample.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by chamsol kim on 2023/05/31.
//

import SwiftUI

struct OnAppearExample: View {
    
    @State var text = "Start text."
    @State var count = 0
    
    var body: some View {
        NavigationStack {
            ScrollView {
                Text(text)
                LazyVStack {
                    ForEach(0..<50) { _ in
                        RoundedRectangle(cornerRadius: 25)
                            .frame(height: 200)
                            .padding()
                            /* 이 RoundedRectangle은 각각 onAppear modifier를 가짐
                             * LazyVStack 안에 들어있으므로, 실제로 화면에 나타날 때 초기화된다.
                             * 즉, 스크롤하면서 화면에 새 RoundedRectangle이 나타날 때 마다 onAppear가 호출된다.
                             */
                            .onAppear {
                                /* 이미지를 cell이 화면에 나타났을 때 마다 다운로드 받도록 만든다면
                                 * 여기서 LazyVStack 안에 있는 View에 onAppear를 달아서 사용한다.
                                 */
                                count += 1
                            }
                    }
                }
            }
            /* onAppear를 어디에 붙이는지에 따라 호출되는 시점이 달라진다.
             * 각 view가 렌더링되는 시점이 다르기 때문 (e.g. NavigationStack vs. ScrollView vs. Text)
             */
            .onAppear {
                /* ScrollView가 screen에 나타났을 때 호출됨
                 * Preview는 이미 화면이 나타나있으므로 text가 바로 바뀜
                 * 실제로는 화면이 나타난 뒤에 바뀐다.
                 */
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    text = "This is the new text!"
                }
            }
            .onDisappear {
                /* ScrollView가 screen에서 사라진 후 호출됨
                 */
                text = "Ending text."
            }
            .navigationTitle("On Appear : \(count)")
        }
    }
}

struct OnAppearExample_Previews: PreviewProvider {
    static var previews: some View {
        OnAppearExample()
    }
}
