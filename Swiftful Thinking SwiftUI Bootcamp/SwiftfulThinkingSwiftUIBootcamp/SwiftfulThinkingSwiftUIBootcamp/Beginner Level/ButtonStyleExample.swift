//
//  ButtonStyleExample.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by chamsol kim on 2023/06/01.
//

import SwiftUI

/* 기본 제공되는 button style
 * xcassets에서 'AccentColor'를 설정하면, 버튼들의 기본 color가 반영된다. (배경까지)
 */
struct ButtonStyleExample: View {
    var body: some View {
        VStack {
            
            Button {
                
            } label: {
                /* 버튼 자체에 control size를 적용해도 커스터마이징에 한계가 있음
                 * Button에 custom label를 사용해서 직접 커스터마이징 해서 사용하는게 낫다.
                 */
                Text("Button Title")
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(
//                .capsule
//                .roundedRectangle (default)
                .roundedRectangle(radius: 20)   // corner radius 지정
            )
            .controlSize(.large)
            
            // 1. Primary color (light mode에서 black)
            Button("Plain Button") {
                
            }
            .frame(height: 55)
            .frame(maxWidth: .infinity)
//            .buttonStyle(.plain)
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            
            Button("Bordered Button") {
                
            }
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .buttonStyle(.bordered)
            .controlSize(.regular)
            
            Button("Bordered Prominent Button") {
                
            }
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .buttonStyle(.borderedProminent)
            .controlSize(.small)
            
            Button("Borderless Button") {
                
            }
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .buttonStyle(.borderless)
            .controlSize(.mini)
        }
        .padding()
    }
}

struct ButtonStyleExample_Previews: PreviewProvider {
    static var previews: some View {
        ButtonStyleExample()
    }
}
