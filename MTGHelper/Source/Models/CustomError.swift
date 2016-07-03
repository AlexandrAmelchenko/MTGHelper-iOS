//
//  CustomError.swift
//  MTGHelper
//
//  Created by Alex Amelchenko on 03/07/16.
//  Copyright © 2016 Alex Amelchenko. All rights reserved.
//

import Foundation

class CustomError: ErrorType {
    
    var message: String?
    
    init(message: String?) {
        self.message = message
    }
    
}