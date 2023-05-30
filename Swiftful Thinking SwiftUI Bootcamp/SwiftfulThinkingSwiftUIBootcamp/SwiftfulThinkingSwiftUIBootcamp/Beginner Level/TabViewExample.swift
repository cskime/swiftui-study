//
//  TabViewExample.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by chamsol kim on 2023/05/30.
//

import SwiftUI

struct TabViewExample: View {
    
    var body: some View {
        Example1()
        Example2()
    }
}

extension TabViewExample {
    
    struct Example2: View {
        
        let icons = [
            "heart.fill", "globe", "house.fill", "person.fill"
        ]
        
        var body: some View {
            TabView {
//                RoundedRectangle(cornerRadius: 25)
//                    .foregroundColor(.red)
//                RoundedRectangle(cornerRadius: 25)
//                RoundedRectangle(cornerRadius: 25)
//                    .foregroundColor(.green)
                ForEach(icons, id: \.self) { iconName in
                    Image(systemName: iconName)
                        .resizable()
                        .scaledToFit()
                        .padding(30)
                }
            }
            .background(
                RadialGradient(
                    gradient: Gradient(colors: [Color.red, Color.blue]),
                    center: .center,
                    startRadius: 5,
                    endRadius: 300
                )
            )
            .frame(height: 300)
            /* UIPageControl과 같은 것
             * 기본 dot으로 page를 표시하게 됨
             * tab item에 image가 있다면 image가 page dot을 대신해서 표시됨
             */
            .tabViewStyle(.page)
//            .tabViewStyle(.page(indexDisplayMode: .never))        // never는 하단 dot을 표시하지 않음
            .indexViewStyle(.page(backgroundDisplayMode: .always))  // dot 배경 설정하기
        }
    }
    
    struct Example1: View {
        
        @State var selectedTab = 0
        
        var body: some View {
            /* selection을 같이 초기화 해 주면 처음 선택된 tab을 지정할 수 있음
             * tabItem에 tag를 붙여야 한다. Tag 값을 찾을 수 없을 땐 맨 처음 tab item이 선택된다.
             */
            TabView(selection: $selectedTab) {
                //        TabView {
                
                HomeView(selectedTab: $selectedTab)
                    .tabItem {
                        /* 하단 tabbar에 표시될 tab 버튼 만들기
                         * VStack을 쓰지 않고 image, text가 자기 자리를 찾아감
                         */
                        Image(systemName: "house.fill")
                        Text("Home")
                    }
                    .tag(0)
                
                Text("Brouse Tab")
                    .tabItem {
                        Image(systemName: "globe")
                        Text("Browse")
                    }
                    .tag(1)
                
                Text("Profile Tab")
                    .tabItem {
                        Image(systemName: "person.fill")
                        Text("Profile")
                    }
                    .tag(2)
            }
            .tint(.green)     // tab button 색상 바꾸기
        }
    }
}

struct HomeView: View {
    
    /* Hierarchy의 superview에 있는 State variable을 사용하기 위해 Binding으로 선언 */
    @Binding var selectedTab: Int
    
    var body: some View {
        ZStack {
            Color.red.ignoresSafeArea()
            VStack {
                Text("Home Tab")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                
                Button {
                    selectedTab = 2
                } label: {
                    Text("Go to Profile")
                        .font(.headline)
                        .padding()
                        .padding(.horizontal)
                        .background(.white)
                        .cornerRadius(10)
                }
            }
        }
    }
}

struct TabViewExample_Previews: PreviewProvider {
    static var previews: some View {
        TabViewExample()
    }
}
