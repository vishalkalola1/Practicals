//
//  Storyboard.swift
//  SwapCardTest
//
//  Created by Vishal on 6/10/21.
//

import Foundation
import UIKit

protocol Storyboard: AnyObject {
    static func instantiate() -> Self
}

extension Storyboard where Self: UIViewController {
    static func instantiate() -> Self {
        let id  = String(describing: self)
        let storyboard = UIStoryboard.init(name: "Main", bundle: Bundle.main)
        return storyboard.instantiateViewController(identifier: id) as! Self
    }
}
