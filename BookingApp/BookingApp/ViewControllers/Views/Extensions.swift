//
//  Extensions.swift
//  BookingApp
//
//  Created by Vishal on 5/17/21.
//  Copyright © 2021 zenchef. All rights reserved.
//

import Foundation
import UIKit


///define All ViewController here to access into Application
extension UIViewController {
    static var home : HomeViewController {
        let homeviewcontroller = HomeViewController()
        homeviewcontroller.tabBarItem = UITabBarItem(title: HOME, image: CustomImage.home.image, selectedImage: CustomImage.home.image)
        return homeviewcontroller
    }
    
    static var settings : UIViewController {
        let settings = SettingViewController()
        settings.tabBarItem = UITabBarItem(title: SETTINGS, image: CustomImage.settings.image, selectedImage: CustomImage.settings.image)
        return settings
    }
    
    static var splitview : UIViewController {
        let split = CustomSplitViewController()
        split.tabBarItem = UITabBarItem(title: BOOKINGS, image: CustomImage.bookings.image, selectedImage: CustomImage.bookings.image)
        return split
    }
    
    static var navigationWithBookingTable : UINavigationController {
        let navigation = UINavigationController()
        UINavigationBar.appearance().barTintColor = .brown
        UINavigationBar.appearance().tintColor = UIColor.white
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        navigation.viewControllers = [bookingtableview]
        return navigation
    }
    
    static var bookingtableview : BookingTableViewController {
        return BookingTableViewController()
    }
}


//Define TabBar Images
enum CustomImage {
    case home
    case bookings
    case settings
}

extension CustomImage {
    var image: UIImage {
        switch self {
        case .home:
            if #available(iOS 13.0, *) {
                return UIImage.init(systemName: "house")!
            } else {
                return UIImage.init(named:"house")!
            }
        case .bookings:
            if #available(iOS 13.0, *) {
                return UIImage.init(systemName: "square.and.pencil")!
            } else {
                return UIImage.init(named: "square.and.pencil")!
            }
        case .settings:
            if #available(iOS 13.0, *) {
                return UIImage.init(systemName: "seal")!
            } else {
                return UIImage.init(named: "seal")!
            }
        }
    }
}

///Add Constraints to View
extension UIView {
    func addconstraints(_ stack: UIView) -> Void {
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        stack.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        stack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        stack.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 10).isActive = true
    }
    
    func addcenterX(_ stack: UIView) -> Void {
        stack.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }
    
    func equalwidth(_ stack:UIView) -> Void{
        stack.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        stack.heightAnchor.constraint(greaterThanOrEqualToConstant: self.frame.height).isActive = true
    }
}

/// FIXME: comparison operators with optionals were removed from the Swift Standard Libary.
/// Consider refactoring the code to use the non-optional operators.
fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
    switch (lhs, rhs) {
    case let (l?, r?):
        return l < r
    case (nil, _?):
        return true
    default:
        return false
    }
}


/// Create Animated Image with Different Method
///
extension UIImage {
    
    public class func gifImageWithData(_ data: Data) -> UIImage? {
        guard let source = CGImageSourceCreateWithData(data as CFData, nil) else {
            print("image doesn't exist")
            return nil
        }
        
        return UIImage.animatedImageWithSource(source)
    }
    
    public class func gifImageWithURL(_ gifUrl:String) -> UIImage? {
        guard let bundleURL:URL? = URL(string: gifUrl)
        else {
            print("image named \"\(gifUrl)\" doesn't exist")
            return nil
        }
        guard let imageData = try? Data(contentsOf: bundleURL!) else {
            print("image named \"\(gifUrl)\" into NSData")
            return nil
        }
        
        return gifImageWithData(imageData)
    }
    
    public class func gifImageWithName(_ name: String) -> UIImage? {
        guard let bundleURL = Bundle.main
                .url(forResource: name, withExtension: "gif") else {
            print("SwiftGif: This image named \"\(name)\" does not exist")
            return nil
        }
        guard let imageData = try? Data(contentsOf: bundleURL) else {
            print("SwiftGif: Cannot turn image named \"\(name)\" into NSData")
            return nil
        }
        
        return gifImageWithData(imageData)
    }
    
    class func delayForImageAtIndex(_ index: Int, source: CGImageSource!) -> Double {
        var delay = 0.1
        
        let cfProperties = CGImageSourceCopyPropertiesAtIndex(source, index, nil)
        let gifProperties: CFDictionary = unsafeBitCast(
            CFDictionaryGetValue(cfProperties,
                                 Unmanaged.passUnretained(kCGImagePropertyGIFDictionary).toOpaque()),
            to: CFDictionary.self)
        
        var delayObject: AnyObject = unsafeBitCast(
            CFDictionaryGetValue(gifProperties,
                                 Unmanaged.passUnretained(kCGImagePropertyGIFUnclampedDelayTime).toOpaque()),
            to: AnyObject.self)
        if delayObject.doubleValue == 0 {
            delayObject = unsafeBitCast(CFDictionaryGetValue(gifProperties,
                                                             Unmanaged.passUnretained(kCGImagePropertyGIFDelayTime).toOpaque()), to: AnyObject.self)
        }
        
        delay = delayObject as! Double
        
        if delay < 0.1 {
            delay = 0.1
        }
        
        return delay
    }
    
    class func gcdForPair(_ a: Int?, _ b: Int?) -> Int {
        var a = a
        var b = b
        if b == nil || a == nil {
            if b != nil {
                return b!
            } else if a != nil {
                return a!
            } else {
                return 0
            }
        }
        
        if a < b {
            let c = a
            a = b
            b = c
        }
        
        var rest: Int
        while true {
            rest = a! % b!
            
            if rest == 0 {
                return b!
            } else {
                a = b
                b = rest
            }
        }
    }
    
    class func gcdForArray(_ array: Array<Int>) -> Int {
        if array.isEmpty {
            return 1
        }
        
        var gcd = array[0]
        
        for val in array {
            gcd = UIImage.gcdForPair(val, gcd)
        }
        
        return gcd
    }
    
    class func animatedImageWithSource(_ source: CGImageSource) -> UIImage? {
        let count = CGImageSourceGetCount(source)
        var images = [CGImage]()
        var delays = [Int]()
        
        for i in 0..<count {
            if let image = CGImageSourceCreateImageAtIndex(source, i, nil) {
                images.append(image)
            }
            
            let delaySeconds = UIImage.delayForImageAtIndex(Int(i),
                                                            source: source)
            delays.append(Int(delaySeconds * 250.0)) /// Change the gif Speed by adding ms
        }
        
        let duration: Int = {
            var sum = 0
            
            for val: Int in delays {
                sum += val
            }
            
            return sum
        }()
        
        let gcd = gcdForArray(delays)
        var frames = [UIImage]()
        
        var frame: UIImage
        var frameCount: Int
        for i in 0..<count {
            frame = UIImage(cgImage: images[Int(i)])
            frameCount = Int(delays[Int(i)] / gcd)
            
            for _ in 0..<frameCount {
                frames.append(frame)
            }
        }
        
        let animation = UIImage.animatedImage(with: frames,
                                              duration: Double(duration) / 1000.0)
        
        return animation
    }
}

///Map Data into Given Models
extension Data {
    func decode<T:Decodable>(type: T.Type) -> Result<T, Error> {
        do {
            let obj = try JSONDecoder().decode(T.self, from: self)
            return .success(obj)
        } catch let error {
            return.failure(error)
        }
    }
}

///Convert Corer Radius by adding into Xcode
extension UIView {

    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
            if self is UIVisualEffectView{
                layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
            }
        }
    }
}
