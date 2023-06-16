//
//  ListViewModel.swift
//  SwiftulThinkingSwiftUIToDoList
//
//  Created by chamsol kim on 2023/06/16.
//

import Foundation

/* CRUD FUNCTIONS
 * - Create
 * - Read
 * - Update
 * - Delete
 */
class ListViewModel: ObservableObject {
    
    @Published var items: [ItemModel] = []
    
    init() {
        getItems()
    }
    
    func getItems() {
        let newItems = [
            ItemModel(title: "This is the first title!", isCompleted: false),
            ItemModel(title: "This is the second!", isCompleted: true),
            ItemModel(title: "Third!", isCompleted: false),
        ]
        items.append(contentsOf: newItems)
    }
    
    // MARK: - CRUD
    
    func deleteItem(atOffsets offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }
    
    func moveItem(from offsets: IndexSet, to offset: Int) {
        items.move(fromOffsets: offsets, toOffset: offset)
    }
    
    func addItem(title: String) {
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    func updateItem(item: ItemModel) {
        guard let index = items.firstIndex(where: { $0.id == item.id }) else {
            return
        }
        
        items[index] = item.updateCompletion()
    }
}
