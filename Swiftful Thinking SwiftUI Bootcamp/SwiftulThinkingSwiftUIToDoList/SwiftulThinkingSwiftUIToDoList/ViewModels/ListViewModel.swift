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
    
    @Published var items: [ItemModel] = [] {
        didSet {
            saveItems()
        }
    }
    
    let itemsKey = "items_list"
    
    init() {
        getItems()
    }
    
    func getItems() {
        guard let data = UserDefaults.standard.data(forKey: itemsKey) else {
            return
        }
        
        guard let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data) else {
            return
        }
        
        items = savedItems
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
    
    func saveItems() {
        /* @AppStorage는 SwiftUI View에서만 사용하는게 좋다.
         */
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
}
