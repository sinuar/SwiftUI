//
//  Protocol.swift
//  DelegateChangeImage
//
//  Created by Sinuar on 31/01/24.
//

import Foundation

protocol ViewControllerDelegate: AnyObject {
    func changePicture(named: String)
}
