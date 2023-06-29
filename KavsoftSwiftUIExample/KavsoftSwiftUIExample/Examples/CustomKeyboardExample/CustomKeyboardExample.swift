//
//  CustomKeyboardExample.swift
//  KavsoftSwiftUIExample
//
//  Created by chamsol kim on 2023/06/29.
//

import SwiftUI

/* Youtube: TextField Input View
 * https://www.youtube.com/watch?v=jNpdpO32Pjs
 */

struct CustomKeyboardExample: View {
    @State private var text = ""
    @FocusState private var showKeyboard: Bool
    
    var body: some View {
        VStack {
            // Instead of custom icon
            Image(systemName: "apple.logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 60, height: 60)
                .padding(20)
                .background(.indigo)
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
            
            TextField("$100.0", text: $text)
                .inputView {
                    ZStack {
//                       testInputView()
                        customKeyboardView()
                    }
                    .frame(maxWidth: .infinity)
                    // height 고정하지 않아도 intrinsic size에 의해 자동으로 딱 맞는 크기로 맞춰진다.
//                    .frame(height: 300)
                }
                .focused($showKeyboard)
                .font(.largeTitle)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
                .environment(\.colorScheme, .dark)
                .padding([.horizontal, .top], 30)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background {
            Rectangle()
                .fill(
                    LinearGradient(
                        colors: [Color.black.opacity(0.7), Color.black],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .ignoresSafeArea()
        }
    }
    
    
    /* Custom Keyboard Test Input View */
    @ViewBuilder
    func testInputView() -> some View {
        Color.red
            .ignoresSafeArea()
        
        VStack {
            Button("Close Keyboard") {
                showKeyboard = false
            }
            
            Text(text)
            
            Button("Add 123") {
                text.append("123")
            }
            
            /* The content on the TextField InputView is not updating dynamically since the hosting view's root view is not updated dynamically.
             * At the CustomTFKeyboard, update the input view when the updateView method called.
             */
        }
    }
    
    /* Custom Keyboard */
    @ViewBuilder
    func customKeyboardView() -> some View {
        LazyVGrid(columns: Array(repeating: .init(.flexible(), spacing: 10), count: 3), spacing: 10) {
            ForEach(1...9, id: \.self) { index in
                keyboardButton(.text("\(index)")) {
                    /* Adding Text */
                    
                    /* Adding Dollar Sign in Front */
                    if text.isEmpty {
                        text.append("$")
                    }
                    text.append("\(index)")
                }
            }
            
            /* Other Button's With Zero in Center
             */
            keyboardButton(.image("delete.backward")) {
                /* Removing Text On by One */
                if !text.isEmpty {
                    text.removeLast()
                    
                    if text == "$" {
                        text = ""
                    }
                }
            }
            
            keyboardButton(.text("0")) {
                
                /* Adding Dollar Sign in Front */
                if text.isEmpty {
                    text.append("$")
                }
                
                text.append("0")
            }
            
            keyboardButton(.image("checkmark.circle.fill")) {
                showKeyboard = false
            }
        }
        .padding(.horizontal, 15)   // 숫자들이 좀 더 가운데로 모여있게 만들기 위함
        .padding(.vertical, 5)
        .background {
            Rectangle()
                .fill(.gray)
                .ignoresSafeArea()
        }
    }
    
    @ViewBuilder
    func keyboardButton(_ value: KeyboardValue, onTap: @escaping () -> ()) -> some View {
        Button(action: onTap) {
            ZStack {
                switch value {
                case .text(let string):
                    Text(string)
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                case .image(let image):
                    Image(systemName: image)
                        .font(image == "checkmark.circle.fill" ? .title : .title2)
                        .fontWeight(.semibold)
                        .foregroundColor(image == "checkmark.circle.fill" ? .green : .white)
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 15)
            .contentShape(Rectangle())
        }
    }
    
    enum KeyboardValue {
        case text(String)
        case image(String)
    }
}

struct CustomKeyboardExample_Previews: PreviewProvider {
    static var previews: some View {
        CustomKeyboardExample()
    }
}
