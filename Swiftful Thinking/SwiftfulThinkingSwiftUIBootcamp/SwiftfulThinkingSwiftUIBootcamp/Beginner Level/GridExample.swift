//
//  GridExample.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by chamsol kim on 2023/05/20.
//

import SwiftUI

struct GridExample: View {
    /* 정리
     * LazyHGrid, LazyVGrid : Lazy load로 동작하는 Grid 생성 (axis 지정됨)
     * GridItem
     * - LazyHGrid에서는 row 표현
     * - LazyVGrid에서는 column 표현
     * Section : Grid 안에서 section 생성, section 별로 content를 가짐
     */
    var body: some View {
        Example1()
        Example2()
    }
}

extension GridExample {
    struct Example1: View {
        
        /* GridItem 개수로 column 수 지정
         * 1. size로 column에 포함되는 각 row에 있는 item의 크기 지정
         *      - fixed : 고정된 크기(Column 너비)
         *      - flexible : 전체 화면 너비 및 GridItem 개수에 맞게 너비가 유동적으로 변함
         *      - adaptive
         *         - min/max 너비를 만족시키는 최대한 많은 개수의 column을 만든다.
         *         - adaptive size GridItem이 두 개면, column 영역을 GridItem 개수로 나누고, 각 adaptive GridItem에 해당하는 column만 변경된다.
         *      - adaptive보다 flexible을 더 많이 쓴다.
         * 2. spacing : item spacing과 같음.
         *      - 각 GridItem의 오른쪽 spacing
         *      - 마지막 GridItem인 경우 적용되지 않는다.
         */
        let columns: [GridItem] = [
//            GridItem(.adaptive(minimum: 10, maximum: 300), spacing: nil, alignment: nil),
//            GridItem(.adaptive(minimum: 150, maximum: 300), spacing: nil, alignment: nil),
            GridItem(.flexible(), spacing: 6, alignment: nil),
            GridItem(.flexible(), spacing: 6, alignment: nil),
            GridItem(.flexible(), spacing: 6, alignment: nil),
//            GridItem(.flexible(), spacing: nil, alignment: nil),
//            GridItem(.flexible(), spacing: nil, alignment: nil),
//            GridItem(.fixed(50), spacing: nil, alignment: nil),
//            GridItem(.fixed(75), spacing: nil, alignment: nil),
//            GridItem(.fixed(100), spacing: nil, alignment: nil),
//            GridItem(.fixed(75), spacing: nil, alignment: nil),
//            GridItem(.fixed(50), spacing: nil, alignment: nil),
        ]
        
        var body: some View {
            /* Lazy : Data set이 많아서 화면 밖으로 나갈 때, 실제로 화면에 보이기 전 까지 생성/로드하지 않음
             */
            ScrollView {
//                Rectangle()
//                    .fill(.white)
//                    .frame(height: 400)
                
                Rectangle()
                    .fill(.orange)
                    .frame(height: 400)
                
                LazyVGrid(
                    columns: columns,
                    alignment: .center,
                    spacing: 6,       // 스크롤 방향의 spacing (line spacing과 같음)
                    pinnedViews: [.sectionHeaders]
                ) {
                    Section {
                        ForEach(0..<20) { index in
                            Rectangle()
                                .frame(height: 150)
                        }
                    } header: {
                        Text("Section 1")
                            .foregroundColor(.white)
                            .font(.title)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(.blue)
                            .padding()
                    }
                    
                    Section {
                        ForEach(0..<20) { index in
                            Rectangle()
                                .fill(.green)
                                .frame(height: 150)
                        }
                    } header: {
                        Text("Section 2")
                            .foregroundColor(.white)
                            .font(.title)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(.red)
                            .padding()
                    }

                    
//                    ForEach(0..<50) { index in
//                        Rectangle()
//                            .frame(height: 150)
//                    }
                }
                
//                LazyVGrid(columns: columns) {
//                    /* 전체 content가 column 수에 맞게 분배된다.
//                     */
//                    ForEach(0..<50) { index in
//                        Rectangle()
//                            .frame(height: 150)
//                    }
//                }
            }
        }
    }
    
    struct Example2: View {
        let rows: [GridItem] = [
            GridItem(.flexible(), spacing: nil),
            GridItem(.flexible(), spacing: nil),
            GridItem(.flexible(), spacing: nil),
        ]
        var body: some View {
            ScrollView(.horizontal) {
                LazyHGrid(
                    rows: rows,
                    alignment: .top,
                    spacing: 30
                ) {
                    Section("Section 1") {
                        ForEach(0..<20) { index in
                            Text("Item \(index)")
                                .frame(width: 150, height: 150)
                                .background(.blue)
                        }
                    }
                    
                    Section("Section 2") {
                        ForEach(0..<20) { index in
                            Text("Item \(index)")
                                .frame(width: 150, height: 150)
                                .background(.red)
                        }
                    }
                }
            }
        }
    }
}

struct GridExample_Previews: PreviewProvider {
    static var previews: some View {
        GridExample()
    }
}
