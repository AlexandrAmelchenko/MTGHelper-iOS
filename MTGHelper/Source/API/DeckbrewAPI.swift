//
//  DeckbrewAPI.swift
//  MTGHelper
//
//  Created by Alex Amelchenko on 03/07/16.
//  Copyright © 2016 Alex Amelchenko. All rights reserved.
//


import Foundation
import Moya
import ObjectMapper
import RxSwift
import Rage

class DeckbrewAPI: NSObject {
    static let sharedInstance = DeckbrewAPI()
    
    private override init() {}
    
    let client = Rage.builder()
        .withBaseUrl(Config.baseEndpointString)
        .withLogLevel(.Full)
        .build()
    
}




