//
//  HeroListInteractor.swift
//  Dota 2 Heroes
//
//  Created by Adriaan van Schalkwyk on 2021/05/21.
//

import Foundation

class HeroListInteractor: HeroListBoundary {
    private let heroListURL = "https://api.opendota.com/api/heroStats"
    private let networkManager = NetworkManager()
    
    func fetchCatFacts(success: @escaping FetchHeroListSuccess,
                       failure: @escaping FetchHeroListFailure) {
        networkManager.performRequest(url: heroListURL, successBlock: { (data) in
            guard let heroList: [HeroListResponseModel] = try? data.decoded() else {
                //TODO: - Refactor error handeling
                let errorDescription = "A localized description of an error"
                let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: errorDescription])
                failure(error)
                return
            }
            success(heroList)
        }, failureBlock: { (error) in
            failure(error)
            return
        })
    }
    
    
}
