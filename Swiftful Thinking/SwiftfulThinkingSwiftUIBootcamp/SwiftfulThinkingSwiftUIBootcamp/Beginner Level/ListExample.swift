//
//  ListExample.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by chamsol kim on 2023/05/24.
//

import SwiftUI

struct ListExample: View {
    
    var body: some View {
        Example1()
        Example2()
    }
}

extension ListExample {
    
    struct Example1: View {
        
        @State var fruits = [
            "apple", "orange", "banana", "peach"
        ]
        
        var body: some View {
            /* UITableView 모양으로 content를 보여준다.
             */
            List {
                /* View를 하나씩 넣을 수도 있고
                 */
    //            Text("Hello, World!")
    //            Text("Hello, World!")
    //            Text("Hello, World!")
                
                /* Section header/footer를 지정한다.
                 * 원하는 개수 만큼 Section을 만들고, 각 section에 포함될 item들을 content로 넣어준다.
                 */
                Section {
                    /* ForEach로 여러 개를 보여줄 수도 있다.
                     */
                    ForEach(fruits, id: \.self) { fruit in
                        Text(fruit)
                    }
                    /* Swipe delete 기능이 활성화된다.
                     * 영상에서는 실제 delete가 되지 않았는데, 실제로 해 보면 list에서 실제로 삭제되는 차이가 있음
                     * 하지만, 원래 데이터(fruits)에서 삭제되는 것은 아님..
                     */
    //                .onDelete { indexSet in
    //                    /* Delete 버튼을 선택하거나 swipe하면 실행된다.
    //                     */
    //                    fruits.remove(atOffsets: indexSet)
    //                }
                    .onDelete(perform: delete(indexSet:))   // 함수를 직접 전달하면 더 직관적이다.
                } header: {
                    Text("Fruits")
                }
            }
        }
        
        func delete(indexSet: IndexSet) {
            fruits.remove(atOffsets: indexSet)
        }
    }

    struct Example2: View {
        @State var fruits = ["apple", "orange", "banana", "peach"]
        @State var veggies = ["tomato", "potato", "carrot"]
        
        var body: some View {
            /* 영상에서는 NavigationStack(deprecated 되기 전 NavigationView)을 사용하면
             * navigation bar 영역이 자동으로 추가되지만, iOS 16 기준으로는 추가되지 않는다.
             * -> List style이 .sidebar일 때 접을 수 있다. iphone에서는 기본 모습이 insetGroupped와 비슷하게 생겨서 햇갈림
             */
            NavigationStack {
                List {
                    Section {
                        ForEach(fruits, id: \.self) { fruit in
                            Text(fruit.capitalized)
                                .font(.caption)
//                                .foregroundColor(.white)
                                /* 여기서 infinity를 사용해도 모든 영역을 덮지는 못한다.
                                 */
//                                .frame(maxWidth: .infinity, maxHeight: .infinity)
//                                .background(.pink)
                        }
                        .onDelete(perform: delete(indexSet:))
                        /* onMove를 사용하면 edit 상태에서 row의 위치를 바꿀 수 있다. */
                        .onMove(perform: move(indexSet:newOffset:))
                        .listRowBackground(Color.pink)   // 전채 row의 background color를 변경한다.
                    } header: {
//                        Text("Fruits")
                        
                        /* 영상에서는 Section Header를 원하는 대로 만들 수 있다.
                         * 실제로는 text만 표시된다... 크기를 바꿀 수도 없다.
                         */
                        HStack {
                            Text("Friuts")
                            Image(systemName: "falme.fill")
                        }
                    }
                    
                    Section {
                        /* 이 section에서는 delete나 move를 사용하지 않으므로 swipe delete나 row 이동을 하지 못한다.
                         * Edit 버튼을 눌러도 이 section은 반응하지 않는다.
                         */
                        ForEach(veggies, id: \.self) { veggies in
                            Text(veggies.capitalized)
                        }
                    } header: {
                        Text("Veggies")
                    }

                }
                /* Device에 따라 다르게 적용될 수 있다.
                 * iPhone과 iPad에서 다르게 보일 수 있으므로 주의해야 한다. (e.g. sidebar)
                 */
//                .listStyle(GroupedListStyle())
                .listStyle(.sidebar)
                
                /* NavigationStack이 아닌 List 안에서만 accent color를 적용한다. */
                .tint(.purple)
                
                .navigationTitle("Grocery List")
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        /* EditButton은 built in button. List에서 edit 기능을 사용할 수 있게 해 준다.
                         * 영상에서는 EditButton을 추가하기만 하면 section을 접을 수도 있는데, 실제로는 그렇지 않다...
                         */
                        EditButton()
                    }
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Add") {
                            fruits.append("coconut")
                        }
                    }
                }
            }
            /* NavigationStack(NavigationView)에 있는 모든 accent color가 변경된다. */
            .tint(.red)
        }
        
        func delete(indexSet: IndexSet) {
            fruits.remove(atOffsets: indexSet)
        }
        
        func move(indexSet: IndexSet, newOffset: Int) {
            fruits.move(fromOffsets: indexSet, toOffset: newOffset)
        }
        
        func add() {
            fruits.append("coconut")
        }
    }
}

struct ListExample_Previews: PreviewProvider {
    static var previews: some View {
        ListExample()
    }
}
