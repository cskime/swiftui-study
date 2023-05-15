//
//  RegularTitleView.swift
//  Essentials-Learning-SwiftUI
//
//  Created by chamsol kim on 2023/05/14.
//

import SwiftUI

struct RegularTitleView: View {
    @State private var rating = 0
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Apple Cake")
                    .font(.largeTitle)
                StarRating(rating: $rating)
            }
            Spacer()
            Text("5 serving | 45m")
                .font(.subheadline)
        }
        .padding()
        .background(.gray.opacity(0.5))
    }
}

struct RegularTitleView_Previews: PreviewProvider {
    static var previews: some View {
        RegularTitleView()
    }
}
