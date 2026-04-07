//
//  SecondViewController.swift
//  DelegateChangeImage
//
//  Created by Sinuar on 31/01/24.
//

import UIKit

class SecondViewController: UIViewController {
    var imageView: UIImageView = UIImageView()
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("Error")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        // Set up the image
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        
        // Set up constraints
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        imageView.image = UIImage(named: "2")
    }
}

extension SecondViewController: ViewControllerDelegate {
    func changePicture(named: String) {
        imageView.image = UIImage(named: named)
    }
}

