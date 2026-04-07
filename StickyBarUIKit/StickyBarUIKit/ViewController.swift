//
//  ViewController.swift
//  StickyBarUIKit
//
//  Created by Sinuar on 04/12/23.
//

import Foundation
import SwiftUI

class ViewController: UIViewController {
    var tableView:UITableView!
    var headerView:CustomHeaderView!
    var headerHeightConstraint:NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
           view.backgroundColor = UIColor.whiteColor()
           setUpHeader()
           setUpTableView()
    }
    
    func setUpHeader() {
        headerView = CustomHeaderView(frame: CGRectZero, title: "Articles")
        headerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(headerView)
        headerHeightConstraint = headerView.heightAnchor.constraintEqualToConstant(150)
        headerHeightConstraint.isActive = true
        let constraints:[NSLayoutConstraint] = [
            headerView.topAnchor.constraintEqualToAnchor(view.topAnchor),
            headerView.leadingAnchor.constraintEqualToAnchor(view.leadingAnchor),
            headerView.trailingAnchor.constraintEqualToAnchor(view.trailingAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    func setUpTableView() {
        tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        let constraints:[NSLayoutConstraint] = [
            tableView.topAnchor.constraintEqualToAnchor(headerView.bottomAnchor),
            tableView.leadingAnchor.constraintEqualToAnchor(view.leadingAnchor),
            tableView.trailingAnchor.constraintEqualToAnchor(view.trailingAnchor),
            tableView.bottomAnchor.constraintEqualToAnchor(view.bottomAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
        tableView.register(UITableViewCell.self,forCellReuseIdentifier: "cell")
        tableView.dataSource = self
    }
    
}
