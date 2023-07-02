//
//  ListSwipeActionsExample.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by chamsol kim on 2023/06/01.
//

import SwiftUI

struct ListSwipeActionsExample: View {
    
    @State var fruits = [
        "apple", "orange", "banana", "peach"
    ]
    
    var body: some View {
        List {
            ForEach(fruits, id: \.self) { fruit in
                Text(fruit.capitalized)
                    /* onDelete를 달면 swipe해서 delete를 사용할 수 있었다.
                     * swipeAction은 delete 외에 다른 기능을 추가할 수 있게 해 준다.
                     * onDelete는 더 이상 동작하지 않는다. onDelete까지 커스터마이징해서 구현해야 하는 것
                     *
                     * Swipe를 끝까지 하면 기능을 실행시키는 것
                     * allowsFullSwipe가 false면 길게 swipe하지 못한다.
                     *
                     */
                    .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                        Button("Archive") {
                            
                        }
                        .tint(.green)
                        
                        Button("Save") {
                        }
                        .tint(.blue)
                        
                        /* onDelete를 사용하지 않고 delete action을 구현하는 방법
                         * - Button의 role을 .destructive로 설정하고 action에서 데이터 삭제를 구현한다.
                         */
                        Button(role: .destructive) {
                            guard let index = fruits.firstIndex(of: fruit) else {
                                return
                            }
                            fruits.remove(at: index)
                        } label: {
                            Text("Delete")
                        }
                    }
                    .swipeActions(edge: .leading, allowsFullSwipe: false) {
                        Button("Share") {
                            
                        }
                        .tint(.yellow)
                    }
            }
            .onDelete(perform: delete)
        }
    }
    
    func delete(indexSet: IndexSet) {
        
    }
}

struct ListSwipeActionsExample_Previews: PreviewProvider {
    static var previews: some View {
        ListSwipeActionsExample()
    }
}
