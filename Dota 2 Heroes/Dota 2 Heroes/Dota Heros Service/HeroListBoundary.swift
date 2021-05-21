//
//  HeroListBoundary.swift
//  Dota 2 Heroes
//
//  Created by Adriaan van Schalkwyk on 2021/05/21.
//

import Foundation

typealias FetchHeroListSuccess = ([HeroListResponseModel]?) -> Void
typealias FetchHeroListFailure = (Error) -> Void

protocol HeroListBoundary {
    func fetchCatFacts(success: @escaping FetchHeroListSuccess,
                       failure: @escaping FetchHeroListFailure)
}
