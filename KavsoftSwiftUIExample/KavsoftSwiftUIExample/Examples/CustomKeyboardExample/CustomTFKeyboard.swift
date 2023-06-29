//
//  CustomTFKeyboard.swift
//  KavsoftSwiftUIExample
//
//  Created by chamsol kim on 2023/06/29.
//

import SwiftUI

// MARK: - Custom TextField Keyboard TextField Modifier

extension TextField {
    
    @ViewBuilder
    func inputView<Content: View>(content: @escaping () -> Content) -> some View {
        self.background {
            SetTFKeyboard(keyboardContent: content())
        }
    }
}


// MARK: - Set TextField Keyboard

fileprivate struct SetTFKeyboard<Content: View>: UIViewRepresentable {
    
    var keyboardContent: Content
    @State private var hostingController: UIHostingController<Content>?
    
    
    func makeUIView(context: Context) -> UIView {
        UIView()
    }
    func updateUIView(_ uiView: UIView, context: Context) {
        DispatchQueue.main.async {
            /* uiView == background
             * uiView.superview == .background {}
             * uiView.superview?.superview == TextField Hosting Container
             */
            if let textFieldContainerView = uiView.superview?.superview {
                /* <_TtGC7SwiftUI16PlatformViewHostGVS_P10
                 $1061f446832PlatformViewRepresentableAdaptorVS_P10
                 $10614da5024PlatformTextFieldAdaptor__: 0x153411b00;
                    baseClass = _UIConstraintBasedLayoutHostingView;
                    frame = (30 486.333; 333 42.3333);
                    anchorPoint = (0, 0);
                    tintColor = UIExtendedSRGBColorSpace 0 0.478431 1 1;
                    layer = <CALayer: 0x6000022ab860>>
                 *
                 * Text field is wrapped inside a hosting view. (10614da5024PlatformTextFieldAdaptor__)
                 */
//                print(textFieldContainerView.subviews)
                
                /* Get embedded UIKit's UITextField from the SwiftUI TextField
                 * With the help of this, we can easily add the custom input view to the TextField.
                 *
                 */
                if let textField = textFieldContainerView.textField {
                    
                   /* If the input is already set, then updating it's content
                    */
                    if textField.inputView == nil {
                        /* Now with the help of UIHostingController converting SwiftUI View into UIKit View
                         */
                        hostingController = UIHostingController(rootView: keyboardContent)
                        hostingController?.view.frame = .init(
                            origin: .zero,
                            size: hostingController?.view.intrinsicContentSize ?? .zero
                        )
                        
                        // Setting TextField's Input view as our SwiftUI View
                        textField.inputView = hostingController?.view
                    } else {
                        /* Updating Hosting Content
                         */
                        hostingController?.rootView = keyboardContent
                    }
                    
                } else {
                    print("Failed to find TextField")
                }
            }
        }
    }
}

struct CustomTFKeyboard_Previews: PreviewProvider {
    static var previews: some View {
        CustomKeyboardExample()
    }
}


// MARK: - Extracting TextField From the Subviews

fileprivate extension UIView {
    
    /* Combine all the subviews into a single array and find the text field that is inside the container.
     */
    var allSubviews: [UIView] {
        subviews.flatMap { [$0] + $0.subviews }
    }
    
    /* Finding the UIView is TextField or Not
     */
    var textField: UITextField? {
        if let textField = allSubviews.first(
            where: { view in view is UITextField }
        ) as? UITextField {
            return textField
        }
        
        return nil
    }
}
