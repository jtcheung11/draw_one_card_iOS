//
//  CardError.swift
//  deck-of-one-card
//
//  Created by Jonmichael Cheung on 2/22/22.
//

import Foundation

enum CardError: LocalizedError {
    case invalidURL
    case thrownError(Error)
    case noData
    case unableToDecode
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Internal error. Please update Deck of One Card or contact support"
        case .thrownError(let error):
            return error.localizedDescription
        case .noData:
            return "The server responded with no data."
        case .unableToDecode:
            return "The Server responded with bad data."
        }
    }
}
