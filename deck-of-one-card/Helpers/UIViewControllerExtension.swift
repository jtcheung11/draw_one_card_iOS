//
//  UIViewControllerExtension.swift
//  deck-of-one-card
//
//  Created by Jonmichael Cheung on 2/22/22.
//

import UIKit

extension UIViewController {
   
        func presentErrorToUser(localizedError: LocalizedError) {
            let alertController = UIAlertController(title: "ERROR", message: localizedError.errorDescription, preferredStyle: .actionSheet)
            
            let dismissAction = UIAlertAction(title: "OK", style: .cancel)
            alertController.addAction(dismissAction)
            
            present(alertController, animated: true)
        }
    }

