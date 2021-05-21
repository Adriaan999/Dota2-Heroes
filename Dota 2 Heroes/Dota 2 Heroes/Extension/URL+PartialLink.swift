//
//  URL+PartialLink.swift
//  Dota 2 Heroes
//
//  Created by Adriaan van Schalkwyk on 2021/05/21.
//

import Foundation

extension URL {
    var urlComponents: URLComponents? {
        return URLComponents(url: self, resolvingAgainstBaseURL: false)
    }
    
    func PartialLink(path: String) -> URL? {
        guard var urlComponents = urlComponents else { return nil }
        urlComponents.path = path
        return urlComponents.url
    }
}
