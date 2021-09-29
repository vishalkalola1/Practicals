//
//  LystPractical
//
//  Created by Vishal on 7/20/21.
//

import Foundation

extension String {
    
    func UTCToLocal(incomingFormat: String, outGoingFormat: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = incomingFormat
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        
        guard let dt = dateFormatter.date(from: self) else { return "" }
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.dateFormat = outGoingFormat
        return dateFormatter.string(from: dt)
    }
    
}
