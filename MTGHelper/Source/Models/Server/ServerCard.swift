//
//  ServerCard.swift
//  MTGHelper
//
//  Created by Alex Amelchenko on 03/07/16.
//  Copyright © 2016 Alex Amelchenko. All rights reserved.
//

import Foundation
import ObjectMapper

class ServerCard: Mappable {
    
    var name : String?
    
    init(){
    }
    
    required init?(_ map: Map) {
        
    }
    
    func mapping(map: Map) {
        name <- map["name"]
    }
    
}

extension ServerCard {
    func toLocal() -> Card {
        let card = Card()
        card.baseName = name
        return card
    }
}
