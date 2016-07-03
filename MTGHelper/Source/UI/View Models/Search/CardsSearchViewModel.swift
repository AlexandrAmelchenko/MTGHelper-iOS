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
    
    func loadCardsByName(name : String?) {
        self.searchController?.showLoading()
        let observable = CardsSearchService().getCardsByName(name)
        let _ = observable.subscribeOn(ConcurrentDispatchQueueScheduler(globalConcurrentQueueQOS: .Background)).observeOn(MainScheduler.instance).subscribe(onNext: { (success) in
//            self.appointments = self.mapServerAppointments(success)
            self.searchController?.hideLoading()
//            self.appointmentsController?.reloadData()
            }, onError: { (error) in
                self.searchController?.hideLoading()
                self.searchController?.showError(error.message())
            }, onCompleted: {
        }) {
        }
    }

}
