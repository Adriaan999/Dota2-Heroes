//
//  HeroListViewModel.swift
//  Dota 2 Heroes
//
//  Created by Adriaan van Schalkwyk on 2021/05/21.
//

import Foundation

protocol HeroListViewModelDelegate {
    func didFetchHeroList()
}

class HeroListViewModel {
    private var interactor: HeroListBoundary
    private var delegate: HeroListViewModelDelegate
    var heroList: [HeroListResponseModel]?
    
    init(interactor: HeroListBoundary,
         delegate: HeroListViewModelDelegate) {
        self.interactor = interactor
        self.delegate = delegate
    }
    
    func fetcHeroList() {
        interactor.fetchCatFacts { [weak self] (response) in
            self?.heroList = response
            self?.delegate.didFetchHeroList()
        } failure: { (error) in
            print(error.localizedDescription)
        }
    }

}
