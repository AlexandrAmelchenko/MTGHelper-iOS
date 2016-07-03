//
//  ServerResponse.swift
//  MTGHelper
//
//  Created by Alex Amelchenko on 03/07/16.
//  Copyright © 2016 Alex Amelchenko. All rights reserved.
//

import Foundation
import ObjectMapper

class ServerResponse: Mappable {
    var message: String?
    var code: Int?
    var status: Int?
    
    init() {
    }
    
    required init?(_ map: Map) {
        
    }
    
    func mapping(map: Map) {
        message <- map["message"]
        code <- map["code"]
        status <- map["status"]
    }
}