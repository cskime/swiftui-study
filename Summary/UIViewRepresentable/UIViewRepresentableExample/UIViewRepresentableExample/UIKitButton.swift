//
//  UIKitButton.swift
//  UIViewRepresentableExample
//
//  Created by chamsol kim on 2023/06/30.
//

import UIKit
import SwiftUI

struct UIKitButton: UIViewRepresentable {
    
    let title: String
    let action: () -> Void
    
    private var foregroundColor: UIColor = .tintColor
    
    init(_ title: String, action: @escaping () -> Void) {
        self.title = title
        self.action = action
    }
    
    func makeUIView(context: Context) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.setTitleColor(foregroundColor, for: .normal)
        button.addTarget(
            context.coordinator,
            action: #selector(Coordinator.buttonTouched(_:)),
            for: .touchUpInside
        )
        return button
    }
    
    func updateUIView(_ uiView: UIButton, context: Context) {
        /* UIViewRepresentable로 wrapping한 UIView는 SwiftUI app에서 기본적으로 전체 화면을 꽉 채우도록 늘어난다.
         * Content size에 딱 맞게 줄이려면 vertical 및 horizontal axis로 hugging priority를 높여준다.
         */
        uiView.setContentHuggingPriority(.defaultHigh, for: .vertical)
        uiView.setContentHuggingPriority(.defaultHigh, for: .horizontal)
    }
}

extension UIKitButton {
    
    func makeCoordinator() -> Coordinator {
        Coordinator(action: action)
    }
    
    class Coordinator: NSObject {
        
        let action: () -> Void
        
        init(action: @escaping () -> Void) {
            self.action = action
        }
        
        @objc
        func buttonTouched(_ sender: UIButton) {
            action()
        }
    }
}

extension UIKitButton {
    
    func titleColor(_ color: Color) -> UIKitButton {
        var view = self
        view.foregroundColor = UIColor(color)
        return view
    }
}
