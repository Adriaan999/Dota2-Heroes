//
//  HeroListResponseModel.swift
//  Dota 2 Heroes
//
//  Created by Adriaan van Schalkwyk on 2021/05/21.
//

import Foundation

struct HeroListResponseModel: Codable {
    var heroName: String?
    var imageURL: String?
    
    enum CodingKeys: String, CodingKey {
        case heroName = "localized_name"
        case imageURL = "img"
    }
}
