//
//  CardViewController.swift
//  deck-of-one-card
//
//  Created by Jonmichael Cheung on 2/22/22.
//

import UIKit

class CardViewController: UIViewController {
    
    //MARK: - OUTLETS
    @IBOutlet weak var cardLabel: UILabel!
    @IBOutlet weak var cardImage: UIImageView!
    
    //MARK: - LIFECYCLE METHODS
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - ACTIONS
    @IBAction func drawButtonTapped(_ sender: Any) {
        CardController.fetchCard { [weak self] (result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let card):
                    self?.fetchImageAndUpdateViews(with: card)
                case .failure(let error):
                    self?.presentErrorToUser(localizedError: error)
                }
            }
        }
    }
    
    func fetchImageAndUpdateViews(with card: Card){
        CardController.fetchImage(for: card) { [weak self] (result) in
            DispatchQueue.main.async {
                switch result {
                    
                case .success(let image):
                    self?.cardLabel.text = "\(card.value) of \(card.suit)"
                    self?.cardImage.image = image
                case .failure(let error):
                    self?.presentErrorToUser(localizedError: error)
                }
            }
        }
    }
}// End of class
