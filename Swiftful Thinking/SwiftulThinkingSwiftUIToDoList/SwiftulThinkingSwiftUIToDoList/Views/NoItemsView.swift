//
//  NoItemsView.swift
//  SwiftulThinkingSwiftUIToDoList
//
//  Created by Chamsol Kim on 2023/06/21.
//

import SwiftUI

struct NoItemsView: View {
    
    @State private var animate = false
    
    private let secondaryAccentColor = Color("SecondaryAccentColor")
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                Text("There are no items!")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Are you a productive person? I think you should click the add button and add a bunch of items to your todo list!")
                    .padding(.bottom, 20)
                
                NavigationLink {
                    AddView()
                } label: {
                    Text("Add something 🥳")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(animate ? secondaryAccentColor : Color.accentColor)
                        .cornerRadius(10)
                }
                /* 'animate'로 애니메이션 조절
                 * 여기서 적용된 것
                 * 1. Background 색상
                 * 2. 좌우 padding (늘어났다 줄어드는 효과)
                 * 3. offset : 위아래로 움직이는 효과
                 * 4. scaleEffect : 커졌다 작아지는 효과
                 * 5. offset과 scale을 조절하면서 버튼이 공중에 뜨는 것 같이 움직이는데, shadow도 멀어졌다 가까워지는 효과를 줌
                 */
                .padding(.horizontal, animate ? 30 : 50)
                .shadow(
                    color: animate ? secondaryAccentColor.opacity(0.7) : Color.accentColor.opacity(0.7),
                    radius: animate ? 30 : 10,
                    x: 0,
                    y: animate ? 50 : 30
                )
                .scaleEffect(animate ? 1.1 : 1.0)
                .offset(y: animate ? -7 : 0)
            }
            .frame(maxWidth: 400)
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: addAnimation)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func addAnimation() {
        guard !animate else {
            return
        }
        
        /* 1.5초 뒤에 애니메이션 시작*/
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(
                /* Custom Animation */
                Animation.easeInOut(duration: 2.0).repeatForever()
            ) {
                animate.toggle()
            }
        }
    }
}

struct NoItemsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            NoItemsView()
                .navigationTitle("Title")
        }
    }
}
