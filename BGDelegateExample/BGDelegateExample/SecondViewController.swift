//
//  SecondViewController.swift
//  BGDelegateExample
//
//  Created by Sinuar on 30/01/24.
//

import UIKit

class SecondViewController: UIViewController {
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemMint
    }
}

extension SecondViewController: ViewControllerDelegate {
    func changeBackgroundColour() {
        view.backgroundColor = UIColor(red: CGFloat.random(in: 1..<256)/255, green: CGFloat.random(in: 1..<256)/255, blue: CGFloat.random(in: 1..<256)/255, alpha: CGFloat.random(in: 0...1))
    }
}
