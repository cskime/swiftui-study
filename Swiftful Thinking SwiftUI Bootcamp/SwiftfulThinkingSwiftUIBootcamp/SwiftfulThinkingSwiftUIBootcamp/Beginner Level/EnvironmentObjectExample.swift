//
//  EnvironmentObjectExample.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by chamsol kim on 2023/06/01.
//

import SwiftUI

/* EnvironmentObject로 등록해 둔 object는 사용하려는 screen마다 일일이 의존성을 주입하지 않아도 접근할 수 있게 된다.
 * - ObservedObject
 * - StaeObject
 * - EnvironmentObject : StateObject와 같지만 environment에 넣는 것. 일일이 전달하지 않고 모든 scene에서 background environment에 접근할 수 있다.
 */

/* ObservableObject protocol을 채택함으로써 SwiftUI View가 이 object를 관찰(observe)하도록 만든다.
 */
class EnvironmentViewModel: ObservableObject {
    
    @Published var datas: [String] = []
    
    init() {
        getData()
    }
    
    func getData() {
        datas.append(contentsOf: ["iPhone", "iPad", "iMac", "Apple Watch"])
    }
}

struct EnvironmentObjectExample: View {
    
    /* EnvironmentViewModel을 FinalView까지 전달하려면, DetailView와 FinalView에 @ObservedObject로 전달해야 함
     * Scene이 많아지면 이 방식은 효율적이지 못하다.
     * Object를 전달하는 코드를 연달아 작성해야 하고, 대부분의 scene에서는 실제로 사용하지도 않는데 @ObservedObject로 갖고 있어야 하는 경우도 생김
     */
    @StateObject var viewModel = EnvironmentViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.datas, id: \.self) { item in
                    NavigationLink {
//                        DetailView(selectedItem: item, viewModel: viewModel)
                        DetailView(selectedItem: item)
                    } label: {
                        Text(item)
                    }
                }
            }
            .navigationTitle("iOS Devices")
        }
        /* 여러 View에 걸쳐 사용하려는 object를 EnvironmentObject로 등록해 두고 사용한다.
         * 이제 그 object가 필요한 View에서는 environment에 접근해서 object를 가져올 수 있다.
         * EnvironmentObject로 등록한 object는 hierarchy 아래 모든 View에서 접근할 수 있다.
         *
         * 만약, ViewModel을 여러 개 사용하는데 모두 EnvironmentObject로 등록해 두면 더 혼란스러울 것
         * 1~2개의 View에만 object를 전달해도 되는 경우에는 @StateObject와 @ObservedObject를 사용하는게 좋을 것
         */
        .environmentObject(viewModel)
    }
}

struct DetailView: View {
    
    let selectedItem: String
    
    /* DetailView는 실제로 EnvironmentViewModel을 사용하지 않으므로
     * @ObservedObject를 갖지 않는게 자연스러움
     */
//    @ObservedObject var viewModel: EnvironmentViewModel
    
    var body: some View {
        ZStack {
            Color.orange.ignoresSafeArea()
            
            NavigationLink {
                FinalView()
//                FinalView(viewModel: viewModel)
            } label: {
                Text(selectedItem)
                    .font(.headline)
                    .foregroundColor(.orange)
                    .padding()
                    .padding(.horizontal)
                    .background(.white)
                    .cornerRadius(30)
            }
        }
    }
}

struct FinalView: View {
    
//    @ObservedObject var viewModel: EnvironmentViewModel
    
    /* 상위 View에서 등록해 둔 EnvironmentObject를 사용한다.
     * 실제로 등록해 두지 않았다면 crash 발생
     *
     *
     */
    @EnvironmentObject var viewModel: EnvironmentViewModel
    
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [Color(#colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)), Color(#colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1))]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 20) {
                    ForEach(viewModel.datas, id: \.self) { item in
                        Text(item)
                    }
                }
                .foregroundColor(.white)
                .font(.largeTitle)
            }
        }
    }
}

struct EnvironmentObjectExample_Previews: PreviewProvider {
    static var previews: some View {
        EnvironmentObjectExample()
    }
}
