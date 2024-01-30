//
//  ViewController.swift
//  BGDelegateExample
//
//  Created by Sinuar on 30/01/24.
//

import UIKit

class ViewController: UIViewController {
    weak var delegate: ViewControllerDelegate?
    let secondViewController = SecondViewController()
    
    let navigationButton: UIButton = {
        let button = UIButton()
        let label = "Next"
        
        button.setTitle(label, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = button.frame.width / 2
                
        return button
        
    }()
    
    let button: UIButton = {
        let button = UIButton()
        let label = "Change BG"
        
        button.setTitle(label, for: .normal)
        button.backgroundColor = .lightGray
        button.layer.cornerRadius = button.frame.width / 2
                
        return button
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = secondViewController
        // Do any additional setup after loading the view.
        button.translatesAutoresizingMaskIntoConstraints = false
        navigationButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)
        view.addSubview(navigationButton)
        
        var constraints = [NSLayoutConstraint]()
        constraints.append(button.centerXAnchor.constraint(equalTo: view.centerXAnchor))
        constraints.append(button.centerYAnchor.constraint(equalTo: view.centerYAnchor))
        constraints.append(navigationButton.centerXAnchor.constraint(equalTo: view.centerXAnchor))
        constraints.append(navigationButton.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 8))
        
        NSLayoutConstraint.activate(constraints)
        
        button.addTarget(self, action: #selector(changeSecondaryBackground), for: .touchUpInside)
        navigationButton.addTarget(self, action: #selector(nextViewController), for: .touchUpInside)

    }

    @objc func changeSecondaryBackground() {
        delegate?.changeBackgroundColour()
    }
    
    @objc func nextViewController() {
        self.navigationController?.pushViewController(secondViewController, animated: true)
    }
}
