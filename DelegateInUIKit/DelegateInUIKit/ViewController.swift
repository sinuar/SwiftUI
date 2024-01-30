//
//  ViewController.swift
//  DelegateInUIKit
//
//  Created by Sinuar on 30/01/24.
//

import UIKit

class ViewController: UIViewController {    
    let button: UIButton = {
        let label = "Button"
        let button = UIButton()
        button.setTitle(label, for: .normal)
        button.backgroundColor = .green
        return button
    }()
    
    let label = UILabel()
    
    var counter = 0
    
    let secondViewController = SecondViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        secondViewController.delegate = self // Asignación a self en init o aquí p. ej.
        // La clase que no puede hacer algo. se le asigna la funcionalidad de lo que hará.
        // Se implementa en la clase que hará la acción. O sea aquí.
        button.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(button)
        view.addSubview(label)
        
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        button.addTarget(self, action: #selector(gotoSecondViewController), for: .touchUpInside)
        
        label.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 8).isActive = true
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.text = "\(counter)"
        
    }

    @objc func gotoSecondViewController() {
        self.navigationController?.pushViewController(secondViewController, animated: true)
    }
}

extension ViewController: SecondViewControllerDelegate { // Extension en clase que ejecutará la acción
    func increaseCounter() {
        counter += 1
        label.text = "\(counter)"
    }
}

