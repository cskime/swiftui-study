//
//  FavoriteButton.swift
//  Essentials-Introducing-SwiftUI
//
//  Created by chamsol kim on 2023/04/23.
//

import SwiftUI

struct FavoriteButton: View {
    
    @Binding var isSet: Bool
    
    var body: some View {
        Button {
            isSet.toggle()
        } label: {
            // "Toggle Favorite" string은 view에 표시되진 않지만 voice over 용으로 사용됨
            Label("Toggle Favorite", systemImage: isSet ? "star.fill" : "star")
            // Voice over를 고려하지 않으면 아래와 같이 image만 사용해도 됨
//            Image(systemName: isSet ? "star.fill" : "star")
                .labelStyle(.iconOnly)
                .foregroundColor(isSet ? .yellow : .gray)
        }
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(isSet: .constant(true))
    }
}
