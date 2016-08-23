//
//  CardsSearchService.swift
//  MTGHelper
//
//  Created by Alex Amelchenko on 03/07/16.
//  Copyright © 2016 Alex Amelchenko. All rights reserved.
//

import UIKit
import RxSwift

class CardsSearchService: NSObject {
    
    func getCardsByName(name : String?) -> Observable<ServerCardsList> {
        return DeckbrewAPI.sharedInstance.client.get("/cards")
            .query("name", name)
            .requestJson()
    }
    
}
