//
//  Storyboard.swift
//  ZattooPractical
//
//  Created by Vishal on 7/2/21.
//

import Foundation
import UIKit

protocol Storyboarded: AnyObject {
    static func instantiate() -> Self
}

extension Storyboarded where Self: UIViewController {
    static func instantiate() -> Self {
        let id  = String(describing: self)
        let storyboard = UIStoryboard.init(name: "Main", bundle: Bundle.main)
        return storyboard.instantiateViewController(identifier: id) as! Self
    }
}


extension UIViewController: Storyboarded {}
