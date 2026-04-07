//
//  ContentView.swift
//  StickyBarUIKit
//
//  Created by Sinuar on 04/12/23.
//

import SwiftUI
import UIKit

class ContentView: View {
    StickyBarViewController()
}

class StickyBarViewController: UIViewController, UIScrollViewDelegate {
    // Your content goes here
    let scrollView = UIScrollView()
    let contentView = UILabel()
    
    // Your sticky bar
    let stickyBar = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup your content view
        contentView.backgroundColor = UIColor.lightGray
        // Add your content elements to contentView
        
        // Setup your sticky bar
        stickyBar.backgroundColor = UIColor.blue
        stickyBar.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 50)
        
        // Add your sticky bar to the main view
        view.addSubview(stickyBar)
        
        // Add the scroll view
        scrollView.delegate = self
        scrollView.frame = view.bounds
        scrollView.addSubview(contentView)
        view.addSubview(scrollView)
        
        // Set the content size of the scroll view
        scrollView.contentSize = contentView.bounds.size
        
        // Adjust contentInset to account for sticky bar
        scrollView.contentInset = UIEdgeInsets(top: stickyBar.frame.height, left: 0, bottom: 0, right: 0)
    }
    
    // MARK: - UIScrollViewDelegate
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let yOffset = scrollView.contentOffset.y
        
        // Check if the user has scrolled past the sticky bar
        if yOffset > 0 {
            // Stick the bar to the top
            stickyBar.frame.origin.y = 0
        } else {
            // Move the bar with the scroll view
            stickyBar.frame.origin.y = yOffset
        }
    }
}

// ANOTHER EXAMPLE HERE

class CategoryHeaderView: UIView {
    var imageView:UIImageView!
    var colorView:UIView!
    var bgColor = UIColor(red: 235/255, green: 96/255, blue: 91/255, alpha: 1)
    var titleLabel = UILabel()
    var articleIcon:UIImageView!
    init(frame:CGRect, title: String) {
        self.titleLabel.text = title.uppercaseString
        super.init(frame: frame)
        setUpView()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView() {
        self.backgroundColor = UIColor.whiteColor()
        imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(imageView)
        colorView = UIView()
        colorView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(colorView)
        let constraints:[NSLayoutConstraint] = [
            imageView.topAnchor.constraint(equalTo: self.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            colorView.topAnchor.constraint(equalTo: self.topAnchor),
            colorView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            colorView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            colorView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
        imageView.image = UIImage(named: "testBackground")
        imageView.contentMode = .scaleAspectFill
        colorView.backgroundColor = bgColor
        colorView.alpha = 0.6
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(titleLabel)
        let titlesConstraints:[NSLayoutConstraint] = [
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 28),
        ]
        NSLayoutConstraint.activate(titlesConstraints)
        titleLabel.font = UIFont.systemFont(ofSize: 15)
        titleLabel.textAlignment = .center
        articleIcon = UIImageView()
        articleIcon.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(articleIcon)
        let imageConstraints:[NSLayoutConstraint] = [
            articleIcon.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            articleIcon.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 6),
            articleIcon.widthAnchor.constraint(equalToConstant: 40),
            articleIcon.heightAnchor.constraint(equalToConstant: 40)
        ]
        NSLayoutConstraint.activate(imageConstraints)
        articleIcon.image = UIImage(named: "article")
    }
    
}
