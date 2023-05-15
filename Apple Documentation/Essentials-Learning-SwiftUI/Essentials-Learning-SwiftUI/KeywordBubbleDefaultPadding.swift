//
//  KeywordBubbleDefaultPadding.swift
//  Essentials-Learning-SwiftUI
//
//  Created by chamsol kim on 2023/04/25.
//

import SwiftUI

struct KeywordBubbleDefaultPadding: View {
    let keyword: String
    let symbol: String
    
    // Define numbers that should scale automatically according to the user's Dynamic Type settings.
    @ScaledMetric(relativeTo: .title) var paddingWidth = 14.5
    var body: some View {
        Label(keyword, systemImage: symbol)
            .font(.title)
            .foregroundColor(.white)
            .padding(paddingWidth)
            .background(.purple.opacity(0.7), in: Capsule())
    }
}

struct KeywordBubbleDefaultPadding_Previews: PreviewProvider {
    static let keywords = ["chives", "fern-leaf lavender"]
    static var previews: some View {
        VStack {
//            ForEach(keywords)     // String에 Iden1tifiable을 채택한다면 `id`를 전달하지 않아도 된다.
            ForEach(keywords, id: \.self) {
                KeywordBubbleDefaultPadding(keyword: $0, symbol: "leaf")
            }
        }
    }
}

extension String: Identifiable {
    
    public var id: String {
        self
    }
}
