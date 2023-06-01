//
//  TextSelectionExample.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by chamsol kim on 2023/06/01.
//

import SwiftUI

struct TextSelectionExample: View {
    var body: some View {
        Text("Hello, World!")
            /* Text를 꾹 누를 때 popup이 나타나고 share, copy 등 동작을 가능하게 만든다.
             */
            .textSelection(.enabled)
    }
}

struct TextSelectionExample_Previews: PreviewProvider {
    static var previews: some View {
        TextSelectionExample()
    }
}
