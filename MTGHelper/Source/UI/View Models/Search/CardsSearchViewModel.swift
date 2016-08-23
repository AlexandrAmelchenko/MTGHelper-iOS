//
//  CardsSearchViewModel.swift
//  MTGHelper
//
//  Created by Alex Amelchenko on 03/07/16.
//  Copyright © 2016 Alex Amelchenko. All rights reserved.
//

import Foundation
import RxSwift

class CardsSearchViewModel {
    
    
    weak var searchController : CardsSearchViewControllerInterface?
    var cards = [Card]()
    
    func numberOfCards() -> Int {
        return cards.count
    }
    
    func loadCardsByName(name : String?) {
        self.searchController?.showLoading()
        let observable = CardsSearchService().getCardsByName(name)
        let _ = observable.subscribeOn(ConcurrentDispatchQueueScheduler(globalConcurrentQueueQOS: .Background)).observeOn(MainScheduler.instance).subscribe(onNext: { (success) in
            if let serverCards = success.cards {
                var cardsArray = [Card]()
                for serverCard in serverCards {
                    cardsArray.append(serverCard.toLocal())
                }
                self.cards = cardsArray
            }
            self.searchController?.hideLoading()
            self.searchController?.reloadData()
            }, onError: { (error) in
                self.searchController?.hideLoading()
                self.searchController?.showError("error while loading the data")
            }, onCompleted: {
        }) {
        }
    }
    
}
