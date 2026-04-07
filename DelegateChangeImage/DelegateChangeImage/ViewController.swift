//
//  ViewController.swift
//  DelegateChangeImage
//
//  Created by Sinuar on 31/01/24.
//

import UIKit

class ViewController: UIViewController {
    // Weak reference to the delegate
    weak var delegate: ViewControllerDelegate?
    
    let secondViewController = SecondViewController()
    
    // Create two buttons for navigation and for the action.
    let button: UIButton = {
        let button = UIButton()
        let label = "Change picture"
        
        button.setTitle(label, for: .normal)
        button.backgroundColor = .systemRed
        
        return button
        
    }()
    
    let navigationButton: UIButton = {
        let button = UIButton()
        let label = "See new picture"
        
        button.setTitle(label, for: .normal)
        button.backgroundColor = .systemBlue
        
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Assign the delegate to the class where the action will take place.
        self.delegate = secondViewController
        
        button.translatesAutoresizingMaskIntoConstraints = false
        navigationButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(button)
        view.addSubview(navigationButton)
        
        var constraints = [NSLayoutConstraint]()
        constraints.append(button.centerXAnchor.constraint(equalTo: view.centerXAnchor))
        constraints.append(button.centerYAnchor.constraint(equalTo: view.centerYAnchor))
        
        constraints.append(navigationButton.centerXAnchor.constraint(equalTo: view.centerXAnchor))
        constraints.append(navigationButton.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 16))
        
        NSLayoutConstraint.activate(constraints)
        
        button.addTarget(self, action: #selector(changeThePicture), for: .touchUpInside)
        navigationButton.addTarget(self, action: #selector(nextViewController), for: .touchUpInside)
        
    }
    
    @objc func changeThePicture() {
        let randomPictureName = String(Int.random(in: 1...5))
        delegate?.changePicture(named: randomPictureName)
    }
    
    @objc func nextViewController() {
        self.navigationController?.pushViewController(secondViewController, animated: true)
    }
    
}

