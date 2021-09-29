//
//  GifViewController.swift
//  BookingApp
//
//  Created by Vishal on 5/18/21.
//  Copyright © 2021 zenchef. All rights reserved.
//

import UIKit
import ImageIO

class GifViewController: UIViewController {
    
    var imageView : UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ///Backgroundcolor for viewcontrollers
        self.view.backgroundColor = UIColor.init(red: 237.0/255.0, green: 89.0/255.0, blue: 91.0/255.0, alpha: 1.0)
        
        ///Load Gif from bundle
        let imageData = try? Data(contentsOf: Bundle.main.url(forResource: "gifViewController", withExtension: "gif")!)
        
        ///create animated Image
        let advTimeGif = UIImage.gifImageWithData(imageData!)
        
        ///Create ImageView to show Animated Image
        imageView = UIImageView(image: advTimeGif)
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: 0, y: 0, width:
                                    self.view.frame.size.width, height: self.view.frame.height)
        view.addSubview(imageView)
        
        ///Once the animation is finish change the RootViewController of window. So we can use GifViewController as SplashViewController
        DispatchQueue.main.asyncAfter(deadline: .now() + 9) {
            let appdelegate = (UIApplication.shared.delegate as! AppDelegate)
            appdelegate.window?.rootViewController = CustomTabViewController()
        }
    }
    
    ///Change frame on the rotation of device
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        DispatchQueue.main.async {
            self.imageView.frame = self.view.frame
        }
    }
}
