//
//  CardController.swift
//  deck-of-one-card
//
//  Created by Jonmichael Cheung on 2/22/22.
//

import UIKit

class CardController {
    
    static func fetchCard(completion: @escaping (Result<Card, CardError>) -> Void ) {
        guard let url = URL(string:"https://deckofcardsapi.com/api/deck/new/draw/?count=1") else { return completion(.failure(.invalidURL)) }
        URLSession.shared.dataTask(with: url) { data, _, error in
            
            if let error = error {
                return completion(.failure(.thrownError(error)))
            }
            guard let data = data else { return completion(.failure(.noData))}
            
            do{
                let topLevel = try JSONDecoder().decode(TopLevelObject.self, from: data)
                guard let card = topLevel.cards.first else { return completion(.failure(.noData))}
                return completion(.success(card))
            }catch {
                return completion(.failure(.thrownError(error)))
            }
        }.resume()
    }
    
    static func fetchImage( for card: Card, completion: @escaping ( Result <UIImage, CardError>) -> Void) {
        let url = card.image
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                return completion(.failure(.thrownError(error)))
            }
            guard let data = data else { return completion(.failure(.noData)) }
            guard let image = UIImage(data: data) else { return completion(.failure(.unableToDecode))}
            return completion(.success(image))
        }.resume()
    }
    
}//END OF CLASS
