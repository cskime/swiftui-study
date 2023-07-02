//
//  BackgroundMaterialsExample.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by chamsol kim on 2023/06/01.
//

import SwiftUI

struct BackgroundMaterialsExample: View {
    var body: some View {
        VStack {
            Spacer()
            
            VStack {
                RoundedRectangle(cornerRadius: 4)
                    .frame(width: 50, height: 4)
                    .padding()
                Spacer()
            }
            .frame(height: 350)
            .frame(maxWidth: .infinity)
//            .background(Color.black.opacity(0.5))
            /* 반투명 ~ 불투명한 배경을 갖게 함 (material)
             * regular, thin, thick, ultraThin, ultraThick
             */
            .background(.ultraThinMaterial)
            .cornerRadius(30)
        }
        .ignoresSafeArea()
        .background(
            Image("cat")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
        )
    }
}

struct BackgroundMaterialsExample_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundMaterialsExample()
    }
}
