//
//  ViewModelExample.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by chamsol kim on 2023/05/31.
//

import SwiftUI

/* [ 정리 ]
 * View에는 UI 관련 코드만 두기 위해 data 관련 코드를 ViewModel로 옮김
 * - @Published
 *    - ObservableObject protocol이 채택된 class (ViewModel)에서 사용한다.
 *    - 값이 변경될 때 마다 값을 publish하고 ObservableObject를 갱신하여 View를 업데이트 시킬 수 있다.
 * - @ObservedObject : 어떤 class에서 @Published property의 값을 publish할 때, SwiftUI에게 View를 갱신해달라고 알린다.
 * - @StateObject : View가 reload 되더라도 갱신되지 않는(persistance) property로 만들 때 사용한다.
 * - ObservableObject
 *    - @ObservedObject property wrapper를 사용하기 위해 class가 채택해야 하는 protocol
 *    - Xcode가 이 class가 observable 하다는 것을 알게 된다.
 *
 * @ObservedObject와 @StateObject는 어떻게 구분해서 사용하는지?
 * - @ObservedObject : ObservableObject class를 second view나 subview로 전달할 때 사용 (USE THIS FOR SUBVIEWS)
 * - @StateObject : ObservableObject class의 인스턴스를 생성할 때 사용 (USE THIS ON CREATION / INIT)
 *
 * 비교
 * |   Value type   |   Reference Type   |
 * | -------------- | ------------------ |
 * |     @State     |    @StateObject    |
 * |    @Binding    |   @ObservedObject  |
 * |     struct     | class(ObservableObject) |
 */


struct FruitModel: Identifiable {
    let id = UUID().uuidString  // creates random user id
    let name: String
    let count: Int
}

/* Scene 뒤에 있는 data class를 구현하여 MVVM architectual pattern을 사용한다.
 * View에서 실제 데이터나 함수를 갖지 않도록 만든다.
 * 실제로 UI와 관련된 것만 남기고, data와 관련된 것들을 분리한다.
 * Data downloading 관련 코드를 보려고 View를 모두 뒤지는 것은 좋지 않다.
 * 이렇게 분리하면 ViewModel 안에서만 찾으면 된다.
 */
class FruitViewModel: ObservableObject {
    
    /* @State를 붙이지 않았다.
     * @State는 View에서 사용할 데이터를 SwiftUI 내부 저장공간에 저장해 두고 관리하는 개념임
     *
     * @Published
     * - class에서 사용하는 @State와 같은 개념이라고 생각해도 된다.
     * - @Published property wrapper가 붙은 property의 값이 바뀌면 publish한다.
     */
    @Published var fruits = [FruitModel]()
    
    @Published var isLoading = false
    
    init() {
        getFruits()
    }
    
    func getFruits() {
        let fruit1 = FruitModel(name: "Orange", count: 1)
        let fruit2 = FruitModel(name: "Banana", count: 2)
        let fruit3 = FruitModel(name: "Watermelon", count: 88)
        
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.isLoading = false
            self.fruits.append(contentsOf: [fruit1, fruit2, fruit3])
        }
    }
    
    func deleteFruit(_ indexSet: IndexSet) {
        fruits.remove(atOffsets: indexSet)
    }
}

struct ViewModelExample: View {
    
//    @State var fruits = [FruitModel]()
    
    /* 일반 struct model을 ViewModel로 대신한다.
     * 이렇게만 하면 View는 실제로 데이터를 화면에 보여주지 못함. 초기값 빈 배열만 가지고 View를 한 번 그리는 것.
     * why? 이 property는 SwiftUI View가 변경을 감지하지 못하기 때문. 즉, State가 이니기 때문
     * SwiftUI에게 "이 value가 변경되면 View를 갱신해줘"라고 말해줘야 한다.
     */
//    var fruitViewModel: FruitViewModel = FruitViewModel()
    
    /* @State와 같은 것
     * @ObservedObject : View에서 class를 위한 @State라고 이해해도 된다.
     * @ObservedObject property wrapper를 사용하려면, 그 class가 ObservableObject protocol을 채택해야 한다.
     */
//    @ObservedObject var fruitViewModel = FruitViewModel()
    
    /* [ 주의할 것 ]
     * View가 animation 등에 의해 갱신될 때, ObservableObject도 갱신된다.
     * ObservableObject 안에서 data를 갱신하고 있다면, View가 갱신될 때 마다 data도 갱신하게 될 것
     * 이것은 원하는 동작이 아니다.
     * View가 reload 되더라도 model이 reload되면 안된다.
     *
     * @StateObject
     * - @Stae와 기본적으로 같음
     * - 단, View가 reload 되더라도 @StateObject는 갱신되지 않는다. (갱신되지 않는다. persist)
     */
    @StateObject var fruitViewModel = FruitViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                
                if fruitViewModel.isLoading {
                    ProgressView()
                } else {
//                  ForEach(fruits) { fruit in
                    ForEach(fruitViewModel.fruits) { fruit in
                        HStack {
                            Text("\(fruit.count)")
                                .foregroundColor(.red)
                            Text(fruit.name)
                                .font(.headline)
                                .bold()
                        }
                    }
//                  .onDelete(perform: deleteFruit)
                    .onDelete(perform: fruitViewModel.deleteFruit)
                }
            }
            .listStyle(.grouped)
            .navigationTitle("Fruit List")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink {
                        SecondScreen(fruitViewModel: fruitViewModel)
                    } label: {
                        Image(systemName: "arrow.right")
                            .font(.title)
                    }
                }
            }
            /* 다음 화면으로 왔다갔다 할 때 마다 호출되어 data가 계속 갱신될 것
             */
//            .onAppear {
//                // fetch fruits from database
////                getFruits()
//                fruitViewModel.getFruits()
//            }
        }
    }
    
    /* View에서 data와 관련된 코드를 제거함으로써 View 코드가 더 단순하고 짧아졌다.
     */
    
//    func getFruits() {
//        let fruit1 = FruitModel(name: "Orange", count: 1)
//        let fruit2 = FruitModel(name: "Banana", count: 2)
//        let fruit3 = FruitModel(name: "Watermelon", count: 88)
//        fruits.append(contentsOf: [fruit1, fruit2, fruit3])
//    }
//
//    func deleteFruit(_ indexSet: IndexSet) {
//        fruits.remove(atOffsets: indexSet)
//    }
}

extension ViewModelExample {
    
    struct SecondScreen: View {
        
        @Environment(\.dismiss) var dismiss
        
        /* Second screen에서는 직접 object instance를 만들지 않으므로 @ObservableObject로 선언한다.
         */
        @ObservedObject var fruitViewModel: FruitViewModel
        
        var body: some View {
            ZStack {
                Color.green.ignoresSafeArea()
                
                VStack {
                    ForEach(fruitViewModel.fruits) { fruit in
                        Text(fruit.name)
                            .foregroundColor(.white)
                            .font(.headline)
                    }
                    
                    Button {
                        dismiss()
                    } label: {
                        Text("GO BACK")
                            .foregroundColor(.white)
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                    }
                }
            }
        }
    }
}


struct ViewModelExample_Previews: PreviewProvider {
    static var previews: some View {
        ViewModelExample()
    }
}
