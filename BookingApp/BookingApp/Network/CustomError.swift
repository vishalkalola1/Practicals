//
//  CustomError.swift
//  BookingApp
//
//  Created by Vishal on 5/17/21.
//  Copyright © 2021 zenchef. All rights reserved.
//

import Foundation


///Create Enum for Define Custom Error into Default Error Class
enum CustomError : Error {
    case NullURL
    case NullData
}

///Return the localized define error for user friend message and understandable message.
extension CustomError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .NullURL:
            return "The url is not valid."
        case .NullData:
            return "Response data is null"
        }
    }
}
