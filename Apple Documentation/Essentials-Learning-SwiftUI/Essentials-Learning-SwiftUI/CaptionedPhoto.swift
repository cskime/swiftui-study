//
//  CaptionedPhoto.swift
//  Essentials-Learning-SwiftUI
//
//  Created by chamsol kim on 2023/04/29.
//

import SwiftUI

struct CaptionedPhoto: View {
    let assetName: String
    let captionText: String
    var body: some View {
        Image(assetName)
            .resizable()
            .scaledToFit()
            .overlay(alignment: .bottom) {
                Caption(text: captionText)
            }
            .clipShape(RoundedRectangle(cornerRadius:10, style: .continuous))
            .padding()  // Image의 바깥쪽 padding
    }
}

struct Caption: View {
    let text: String
    var body: some View {
        Text(text)
            .padding()  // Text의 안쪽 padding (호출 순서에 따라 layout이 다르게 설정된다.)
            .background(
                // Light, Dark mode에 따라 다른 배경 색 사용
                // Text color는 이미 theme mode에 따라 white/black 으로 다른 색상을 가지고 있음
                // 이 background color는 이에 대조적인 색상으로 정의되어 있음
                Color("TextContrast").opacity(0.75),
                in: RoundedRectangle(cornerRadius: 10, style: .continuous)
            )
            .padding()  // Text의 바깥쪽 padding
    }
}

struct CaptionedPhoto_Previews: PreviewProvider {
    static let landscapeName = "Landscape"
    static let landscapeCaption = "This photo is wider than it is tall."
    static let portraitName = "Portrait"
    static let portraitCaption = "This photo is taller than it is wide."
    static var previews: some View {
        CaptionedPhoto(assetName: portraitName, captionText: portraitCaption)
        CaptionedPhoto(assetName: landscapeName, captionText: landscapeCaption)
            .preferredColorScheme(.dark)
        CaptionedPhoto(assetName: landscapeName, captionText: landscapeCaption)
            .preferredColorScheme(.light)
    }
}
