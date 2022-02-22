//
//  Card.swift
//  deck-of-one-card
//
//  Created by Jonmichael Cheung on 2/22/22.
//

import Foundation

struct Card: Decodable {
    let value: String
    let suit: String
    let image: URL
    
}

struct TopLevelObject: Decodable {
    let cards: [Card]
}
