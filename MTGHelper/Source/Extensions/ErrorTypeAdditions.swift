//
//  ErrorTypeAdditions.swift
//  MTGHelper
//
//  Created by Alex Amelchenko on 03/07/16.
//  Copyright © 2016 Alex Amelchenko. All rights reserved.
//

import Foundation

extension ErrorType {
    
    func message() -> String? {
        if self is CustomError {
            return (self as! CustomError).message ?? ""
        }
        else {
            return ""
        }
    }
    
}
