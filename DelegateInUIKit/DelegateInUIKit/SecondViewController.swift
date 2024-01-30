//
//  SecondViewController.swift
//  DelegateInUIKit
//
//  Created by Sinuar on 30/01/24.
//

import UIKit

class SecondViewController: UIViewController {
    weak var delegate: SecondViewControllerDelegate? // Instancia en clase que va a delegar

    let button: UIButton = {
        let label = "Button"
        let button = UIButton()
        button.setTitle(label, for: .normal)
        button.backgroundColor = .green
        return button
    }()
    
    var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .systemBackground
        button.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(button)
        
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        button.addTarget(self, action: #selector(increaseCounter), for: .touchUpInside)
    }
    
    @objc func increaseCounter() {
        delegate?.increaseCounter()
    }
}
