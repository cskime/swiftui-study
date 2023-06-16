//
//  ItemModel.swift
//  SwiftulThinkingSwiftUIToDoList
//
//  Created by chamsol kim on 2023/06/16.
//

import Foundation

struct ItemModel: Identifiable {
    // ForEach나 List에 넣을 때 Identifiable data를 넣으면 편하기 때문에 Identifiable protocol 채택
    let id = UUID().uuidString
    let title: String
    let isCompleted: Bool
}
