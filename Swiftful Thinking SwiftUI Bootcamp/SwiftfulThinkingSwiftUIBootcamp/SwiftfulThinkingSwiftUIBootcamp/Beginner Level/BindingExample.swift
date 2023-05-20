//
//  BindingExample.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by chamsol kim on 2023/05/20.
//

import SwiftUI

struct BindingExample: View {
    
    /* 정리
     * @State : 해당 View가 갖는 고유한 Property로 자신만의 값을 가짐
     * @Binding : Superview에서 subview로 전달하는 객체로, 두 view 사이에 값이 공유되도록 연결시킴. Superview가 subview의 binding을 추적
     */
    
    @State var backgroundColor: Color = .green
    @State var title = "Title"
    
    var body: some View {
        ZStack {
            backgroundColor
                .ignoresSafeArea()
            
            /* ButtonView는 'Binding<Color>'를 받으려고 함
             * @State property에 dollar sign($)을 사용하면 binding 반환
             * @State property는 subview에 binding을 전달해서 연결시킨다.
             */
//            ButtonView(backgroundColor: $backgroundColor)
            
            VStack {
                Text(title)
                    .foregroundColor(.white)
                ButtonView(backgroundColor: $backgroundColor, title: $title)
            }
        }
    }
}

struct ButtonView: View {
    
    /* ButtonView를 만들 떄 이 property도 초기화 해야 함
     * 어떤 property에 연결할지 지정하게 된다.
     */
    @Binding var backgroundColor: Color
    
    /* 실제 button은 superview에 없고 child view에만 있음.
     * 이 button의 색상을 변경한다면, subview가 가진 고유 속성이므로 @State variable로 만든다.
     * 이 child view의 property는 child view 안에서만 참조됨.
     */
    @State var buttonColor: Color = .blue
    
    @Binding var title: String
    
    var body: some View {
        Button {
            /* 'backgroundColor'는 super view에 있던 @State property
             * Superview에서 subview를 보여주고, subview의 변경사항이 다시 sueprview로 전달되어 superview의 property를 변경시켜야 함
             * 즉, subview에서는 superview의 property와 연결된 property를 가지길 원한다.
             * 그래서 subview의 property가 변경되면 superview의 property도 변경될 수 있게 만들기를 원함
             */
            backgroundColor = .orange
            buttonColor = .pink
            title = "NEW TITLE!!!!!!"
        } label: {
            Text("Button")
                .foregroundColor(.white)
                .padding()
                .padding(.horizontal)
                .background(buttonColor)
                .cornerRadius(10)
        }
    }
}

struct BindingExample_Previews: PreviewProvider {
    static var previews: some View {
        BindingExample()
    }
}
