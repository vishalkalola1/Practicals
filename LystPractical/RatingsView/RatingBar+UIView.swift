//
//  RatingBar+UIView.swift
//  RatingsBarView
//
//  Created by Vishal KALOLA on 28/07/2021.
//
import UIKit

extension UIView {
    
    @discardableResult
    open func addRatingBar(_ insets: UIEdgeInsets = .zero, callback: @escaping ((CGFloat) -> Void)) -> RatingBar {
        let ratingBar = RatingBar()
        addSubview(ratingBar)
        ratingBar.fitInSuperview(with: insets)
        ratingBar.ratingDidChange = callback
        return ratingBar
    }

    func fitInSuperview(with insets: UIEdgeInsets = .zero) {
        guard let superview = superview else {
            assertionFailure("RatingBar:- fitInSuperview was called but view was not in a view hierarchy.")
            return
        }

        let applyInset: (NSLayoutConstraint.Attribute, UIEdgeInsets) -> CGFloat = {
            switch $0 {
            case .top: return $1.top
            case .bottom: return -$1.bottom
            case .left: return $1.left
            case .right: return -$1.right
            default:
                return 0
            }
        }

        translatesAutoresizingMaskIntoConstraints = false

        let attributes = [NSLayoutConstraint.Attribute.top, .left, .right, .bottom]
        superview.addConstraints(attributes.map {
            return NSLayoutConstraint(item: self,
                                      attribute: $0,
                                      relatedBy: .equal,
                                      toItem: superview,
                                      attribute: $0,
                                      multiplier: 1,
                                      constant: applyInset($0, insets))
        })
    }
    
}
