//
//  ListView.swift
//  SwiftulThinkingSwiftUIToDoList
//
//  Created by chamsol kim on 2023/06/16.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        // ItemModel은 Identifiable protocol을 채택하고 있으므로 id를 정해주지 않아도 된다.
        ZStack {
            if listViewModel.items.isEmpty {
                /* NoItemView가 나타날 때 transition 효과 */
                NoItemsView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            } else {    
                List {
                    ForEach(listViewModel.items) { item in
                        ListRowView(item: item)
                            .onTapGesture {
                                withAnimation(.linear) {
                                    listViewModel.updateItem(item: item)
                                }
                            }
                    }
                    /* onDelete는 List에 직접 붙일 수 없음
                     * ForEach에 붙여야 한다.
                     * onDelete를 붙여야 edit button을 누를 때 삭제 버튼이 나타난다.
                     */
                    .onDelete(perform: listViewModel.deleteItem)
                    .onMove(perform: listViewModel.moveItem)
                }
                .listStyle(.plain)
            }
        }
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
        /* Preview에서는 environment object를 등록하지 않았기 때문에
         * 따로 추가해주지 않으면 preview에서 crash가 발생한다.
         */
        .environmentObject(ListViewModel())
    }
}
