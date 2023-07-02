//
//  AsyncImageExample.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by chamsol kim on 2023/06/01.
//

import SwiftUI

struct AsyncImageExample: View {
    
    let url = URL(string: "https://picsum.photos/400")
    
    var body: some View {
        
        /* iOS 15에서 새로 생긴 것
         * 비동기적으로 image를 다운로드 받는다.
         * 기본적으로 화면을 꽉 채우는 layout
         * 이미지 다운로드가 완료되면, image 크기에 맞게 layout이 잡힌다.
         */
//        AsyncImage(url: url)
//            /* Image를 다운받기 전 크기는 frame으로 줄어들지만
//             * 이미지를 다운로드하면 frame으로 정한 크기가 아닌 이미지 크기에 맞게 맞춰진다.
//             */
//            .frame(width: 100, height: 100)
        
        
        /* content에 직접 image를 표시하고 modifier를 사용하면 이미지 크기를 원하는 대로 조절할 수 있다.
         * 다운받은 image는 Default URLSession Cache에 저장된다.
         *
         */
//        AsyncImage(url: url) { image in
//            image
//                .resizable()
//                .scaledToFit()
//                .frame(width: 100, height: 100)
//                .cornerRadius(20)
//        } placeholder: {
//            ProgressView()
//        }
        
        
        /* Image 다운로드 상태, 결과에 따라 다른 View를 보여줄 때 사용
         */
        AsyncImage(url: url) { phase in
            switch phase {
            case .empty:
                ProgressView()
                
            case .success(let image):
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .cornerRadius(20)
                
            case .failure(let error):
                Image(systemName: "questionmark")
                    .font(.headline)
            
            default:
                Image(systemName: "questionmark")
                    .font(.headline)
            }
        }
    }
}

struct AsyncImageExample_Previews: PreviewProvider {
    static var previews: some View {
        AsyncImageExample()
    }
}
