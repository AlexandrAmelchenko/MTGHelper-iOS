//
//  ServerCardsList.swift
//  MTGHelper
//
//  Created by Alex Amelchenko on 03/07/16.
//  Copyright © 2016 Alex Amelchenko. All rights reserved.
//

import Foundation
import ObjectMapper

class ServerCardsList: Mappable {
    
    var cards : [ServerCard]?
    
    init(){
    }
    
    required init?(_ map: Map) {
    }
    
    func mapping(map: Map) {
        cards <- map["cards"]
    }
    
}
