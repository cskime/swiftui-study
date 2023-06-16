//
//  ListView.swift
//  SwiftulThinkingSwiftUIToDoList
//
//  Created by chamsol kim on 2023/06/16.
//

import SwiftUI

struct ListView: View {
    
    @State private var items: [ItemModel] = [
        ItemModel(title: "This is the first title!", isCompleted: false),
        ItemModel(title: "This is the second!", isCompleted: true),
        ItemModel(title: "Third!", isCompleted: false),
    ]
    
    var body: some View {
        // ItemModel은 Identifiable protocol을 채택하고 있으므로 id를 정해주지 않아도 된다.
        List(items) { item in
            ListRowView(item: item)
        }
        .listStyle(.plain)
        .navigationTitle("Todo List 📝")
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                EditButton()
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink("Add") {
                    AddView()
                }
            }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ListView()
        }
    }
}
