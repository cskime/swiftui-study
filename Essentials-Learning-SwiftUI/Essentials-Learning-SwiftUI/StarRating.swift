//
//  StarRating.swift
//  Essentials-Learning-SwiftUI
//
//  Created by chamsol kim on 2023/05/14.
//

import SwiftUI

struct StarRating: View {
    @Binding var rating: Int
    private let maxRating = 5
    
    var body: some View {
        HStack {
            ForEach(1..<maxRating + 1, id: \.self) { value in
                Image(systemName: "star")
                    .symbolVariant(value <= rating ? .fill : .none)
                    .foregroundColor(.accentColor)
                    .onTapGesture {
                        rating = value != rating ? value : 0
                    }
            }
        }
    }
}

struct StarRating_Previews: PreviewProvider {
    @State static var rating = 0
    static var previews: some View {
        StarRating(rating: $rating)
    }
}
