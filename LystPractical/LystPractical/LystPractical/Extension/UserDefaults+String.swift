//
//  LystPractical
//
//  Created by Vishal on 7/20/21.
//

import Foundation

extension UserDefaults {
    var token: String? {
        get {
            guard let token = UserDefaults.standard.value(forKey: "token") as? String else {
                return nil
            }
            return token
        }
        
        set {
            if newValue != nil {
                UserDefaults.standard.set(newValue, forKey: "token")
            }
        }
    }
}
