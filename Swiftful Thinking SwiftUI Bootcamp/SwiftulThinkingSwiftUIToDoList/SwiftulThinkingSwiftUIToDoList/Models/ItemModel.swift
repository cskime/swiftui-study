//
//  ItemModel.swift
//  SwiftulThinkingSwiftUIToDoList
//
//  Created by chamsol kim on 2023/06/16.
//

import Foundation

struct ItemModel: Identifiable {
    /* ForEach나 List에 넣을 때 Identifiable data를 넣으면 편하기 때문에 Identifiable protocol 채택
     */
    
    /* Struct는 Immutable
     * 속성들을 모두 let으로 선언해서 언제 어디서도 변경되지 않을 것을 보장하는게 좋다.
     * 값을 변경하려면, 정해진 함수를 사용해야만 하고(updateCompletion),
     * 이것은 기존 속성의 값읇 변경하는게 아니라 새로운 struct를 만드는 방식으로 한다.
     */
    let id: String
    let title: String
    let isCompleted: Bool
    
    /* ItemModel의 isCompleted를 업데이트할 때, 새로 만든 ItemModel의 id가 동일해야 하기 때문에, id를 주입하도록 변경한다.
     */
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func updateCompletion() -> ItemModel {
        ItemModel(id: id, title: title, isCompleted: !isCompleted)
    }
}
