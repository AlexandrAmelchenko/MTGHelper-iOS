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
    var imageUrl : String?
    
    init(){
    }
    
    required init?(_ map: Map) {
        
    }
    
    func mapping(map: Map) {
        name <- map["name"]
        imageUrl <- map["imageUrl"]
    }
    
}

extension ServerCard {
    func toLocal() -> Card {
        let card = Card()
        card.baseName = name
        if let imageFullUrl = imageUrl {
            let fullUrlArr = imageFullUrl.characters.split{$0 == "/"}.map(String.init)
            card.imageSubUrlString = fullUrlArr[fullUrlArr.endIndex - 1]
        }
        return card
    }
}
