//
//  Data+Decoding.swift
//  Dota 2 Heroes
//
//  Created by Adriaan van Schalkwyk on 2021/05/21.
//

import Foundation

public extension Data {
    
    func decoded<T: Decodable>() throws -> T {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(DateFormatter.formatStandardDate)
        do {
            return try decoder.decode(T.self, from: self)
        } catch let DecodingError.dataCorrupted(context) {
            print(context)
        } catch let DecodingError.keyNotFound(key, context) {
            print("Key '\(key)' not found:", context.debugDescription)
            print("codingPath:", context.codingPath)
        } catch let DecodingError.valueNotFound(value, context) {
            print("Value '\(value)' not found:", context.debugDescription)
            print("codingPath:", context.codingPath)
        } catch let DecodingError.typeMismatch(type, context) {
            print("Type '\(type)' mismatch:", context.debugDescription)
            print("codingPath:", context.codingPath)
        } catch {
            print("error: ", error)
        }
        
        return try JSONDecoder().decode(T.self, from: self)
    }
}

extension DateFormatter {
    static let formatStandardDate: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter
    }()
}
