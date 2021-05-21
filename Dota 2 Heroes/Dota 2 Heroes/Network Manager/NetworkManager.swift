//
//  NetworkManager.swift
//  Dota 2 Heroes
//
//  Created by Adriaan van Schalkwyk on 2021/05/21.
//

import Foundation

typealias PerformRequestSuccess = (Data) -> Void
typealias PerformRequestFailure = (Error) -> Void

class NetworkManager {
    private var dataTask: URLSessionDataTask?
    private var networkURLSession: URLSession!

    func performRequest(url: String,
                        successBlock: @escaping PerformRequestSuccess,
                        failureBlock: @escaping PerformRequestFailure) {
        dataTask?.cancel()
        if let url = URL(string: url) {
            networkURLSession = URLSession(configuration: .default)
            dataTask = networkURLSession.dataTask(with: url) { [weak self] (data, response, error) in
                defer { self?.dataTask = nil }
                if let error = error {
                    return failureBlock(error)
                }
                guard let responseData = data else {
                    return failureBlock(error!) }
                return successBlock(responseData)
            }
            dataTask?.resume()
        }
    }
}
