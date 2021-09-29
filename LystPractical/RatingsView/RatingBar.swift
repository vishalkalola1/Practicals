//
//  RatingBar.swift
//  RatingsBarView
//
//  Created by Vishal KALOLA on 28/07/2021.
//

import UIKit

@IBDesignable open class RatingBar: UIView {
    
    @IBInspectable open var filledIcon: String = "★" {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable open var unFilledIcon: String = "☆" {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable open var fontMultiplier: CGFloat = 5 {
        didSet {
            drawRatingBar()
            setNeedsLayout()
        }
    }
    
    @IBInspectable open var spaceOffset: CGFloat = 1 {
        didSet {
            if spaceOffset <= 0 {
                spaceOffset = 1
            }
            drawRatingBar()
            setNeedsLayout()
        }
    }
    
    
    var starSizeMax: CGFloat {
        if fontMultiplier < 5 {
            fontMultiplier = 5
        }
        let maxSize: CGFloat = (bounds.size.width >= bounds.size.height) ? bounds.size.width : bounds.size.height
        return maxSize / fontMultiplier
    }
    
    open var starFont = UIFont.systemFont(ofSize: 0) {
        didSet {
            drawRatingBar()
            setNeedsDisplay()
        }
    }
    
    let starSizeMin: CGFloat = 10

    var filledView: UIView!
    
    var ratingWidth: CGFloat {
        return bounds.size.width / _maxValue / spaceOffset
    }
    
    open var ratingDidChange: ((CGFloat) -> Void)?
    
    /// Star text allignment
    open var starAlignment: NSTextAlignment = .center
    
    @IBInspectable open var value: CGFloat = 0 {
        didSet{
            
            if value < 0 {
                value = 0
            }
            else if _maxValue < value {
                value = _maxValue
            }
            
            value = isAbsValue ? round(value+0.3) : value
            
            setNeedsDisplay()
        }
    }
    
    var _maxValue: CGFloat {
        return CGFloat(maxValue)
    }
    
    @IBInspectable open var maxValue: Int = 5 {
        didSet {
            if maxValue < 3 {
                maxValue = 3
            }
            setNeedsLayout()
        }
    }
    
    /// RatingBar User Interaction Enabled
    @IBInspectable open var isEnabled: Bool = true {
        didSet {
            setupTapGesture()
            setNeedsLayout()
        }
    }
    
    
    /// RatingBar color
    @IBInspectable open var color: UIColor = .blue {
        didSet{
            setNeedsLayout()
        }
    }
    
    /// RatingBar Animaiton Bool
    @IBInspectable open var canAnimate: Bool = true {
        didSet{
            setNeedsLayout()
        }
    }
    
    /// RatingBar rating value absolute Bool
    @IBInspectable open var isAbsValue: Bool = true {
        didSet{
            setNeedsLayout()
        }
    }
    
    // MARK:- RatingBar Animation Interval
    
    var _animationInterval: TimeInterval {
        return canAnimate ? animationInterval : 0
    }
    @IBInspectable open var animationInterval: TimeInterval = 0.3 {
        didSet{
            setNeedsLayout()
        }
    }
    
    /// RatingBar rating tap gesture
    var ratingTapGesture: UITapGestureRecognizer  {
        get {
            let tapGesture = UITapGestureRecognizer(target: self,
                                                    action: #selector(didTapped(_:)))
            tapGesture.numberOfTapsRequired = 1
            return tapGesture
        }
    }
    
    /// RatingBar check value isEmpty
    open var isEmpty: Bool {
        return value <= 0 ? true : false
    }
    
    /// Drawing RatingBar
    ///
    /// - Parameter rect: view frame
    
    open override func draw(_ rect: CGRect) {
        super.draw(rect)
        drawRatingBar()
        ratingValueChange()
        setupTapGesture()
    }
    
    /// Draw Initial rating bar
    func drawRatingBar() {
        subviews.forEach { $0.removeFromSuperview() }
        let unFilledView = getRatingView(withIcon: unFilledIcon)
        filledView = getRatingView(withIcon: filledIcon)
        addSubview(filledView)
        addSubview(unFilledView)
        
    }
    
    /// Add or remove tap gesture as required
    func setupTapGesture() {
        guard isEnabled else {
            removeGestureRecognizer(ratingTapGesture)
            return
        }
        addGestureRecognizer(ratingTapGesture)
    }
    
    /// Creating View for each filled and unfilled ratings
    ///
    /// - Parameter text: text icon for rating
    /// - Returns: view that contained specific type of rating icons
    func getRatingView(withIcon text: String) -> UIView {
        let view = UIView(frame: self.bounds)
        view.clipsToBounds = true
        view.backgroundColor = .clear
        var frame = self.bounds
        frame.size.width = ratingWidth
                
        for position in 0 ..< maxValue {
            
            frame.origin.x = CGFloat(position) * ratingWidth
            
            let starView = UILabel(frame: frame)
            starView.text = text
            starView.textAlignment = starAlignment
            starView.textColor = color
            starView.numberOfLines = 1
            starView.font = UIFont(name: starFont.fontName, size: starSizeMax)!
            starView.adjustsFontSizeToFitWidth = true
            starView.minimumScaleFactor = starSizeMin/starSizeMax
            view.addSubview(starView)

        }
        
        return view
    }
    
    /// RatingBar Did Tapped
    ///
    /// - Parameter sender: tap gesture
    @objc func didTapped(_ sender: UITapGestureRecognizer){
        
        guard isEnabled else { return }
        
        self.value = (sender.location(in: self).x) / (ratingSize / _maxValue)
        
        UIView.animate(withDuration: _animationInterval) {
            self.ratingValueChange()
        }
    }
    
    /// Change rating frame
    func ratingValueChange() {
        let rating = ratingSize * value / _maxValue
        self.filledView.frame.size.width = rating
        ratingDidChange?(value)
    }
    
    var ratingSize: CGFloat {
        var width: CGFloat = 0
        filledView.subviews.forEach { width += $0.bounds.size.width }
        return width
    }
}
