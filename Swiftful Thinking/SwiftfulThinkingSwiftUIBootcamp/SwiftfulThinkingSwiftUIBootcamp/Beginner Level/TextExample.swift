//
//  TextExample.swift
//  SwiftUIViewer
//
//  Created by chamsol kim on 2023/05/16.
//

import SwiftUI

struct TextExample: View {
    var body: some View {
        VStack {
            Text("Hello, World! This is the Swiftul Thinking Bootcamp. I am really enjoying this course and learning a log.")
            /* Font */
    //            .font(.title)
    //            .font(.system(size: 24))
    //            .font(.system(size: 24, weight: .semibold))
                // preset font는 기기의 폰트크기 설정을 따르지만,직접 설정하면 항상 같은 크기로 설정된다.
                .font(.system(size: 24, weight: .semibold, design: .serif))
    //            .fontWeight(.heavy)
            /* Style */
                .bold()
    //            .bold(true)
    //            .underline()
    //            .underline(pattern: .dashDotDot)
                .underline(color: .red)
                .italic()
    //            .italic(false)
    //            .strikethrough()
                .strikethrough(color: .green)
    //            .strikethrough(pattern: .dot)
    //            .multilineTextAlignment(.leading)
                .baselineOffset(30)
                .kerning(10)
                .multilineTextAlignment(.center)
            .foregroundColor(.blue)
            
            Text("hello World!".capitalized)
                .frame(width: 200, height: 100, alignment: .leading)
                .minimumScaleFactor(0.1)
        }
    }
}

struct TextExample_Previews: PreviewProvider {
    static var previews: some View {
        TextExample()
    }
}
