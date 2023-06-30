//
//  ViewController.swift
//  UIHostingViewControllerExample
//
//  Created by chamsol kim on 2023/07/01.
//

import UIKit
import SwiftUI
import Combine

class ObservableData: ObservableObject {
    @Published var data = ""
    var action: (() -> Void)?
    
}

class ViewController: UIViewController {
    
    let observableData = ObservableData()
    var cancellables = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let presentButton = UIButton(type: .system)
        presentButton.addTarget(self, action: #selector(buttonTouched(_:)), for: .touchUpInside)
        presentButton.setTitle("Present SwiftUI View", for: .normal)
        view.addSubview(presentButton)
        presentButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            presentButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            presentButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        observableData.$data
            .sink { value in
                print("Data From SwiftUI : \(value)")
            }
            .store(in: &cancellables)
        
        observableData.action = {
            print("Action From UIKit")
        }
    }
    
    @objc
    func buttonTouched(_ sender: UIButton) {
        let viewController = UIHostingController(rootView: SwiftUIView(observable: observableData))
        present(viewController, animated: true)
    }
}

