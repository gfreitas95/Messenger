//
//  Alert.swift
//  CAMERA
//
//  Created by Gustavo on 29/07/20.
//  Copyright © 2020 Gustavo. All rights reserved.
//

import Foundation
import UIKit

struct Alert {
    
    static func showAlert(style: UIAlertController.Style, title: String?, message: String?, actions: [UIAlertAction] = [UIAlertAction(title: "Ok", style: .cancel, handler: nil)], completion: (() -> Swift.Void)? = nil) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        
        for action in actions {
            alert.addAction(action)
        }
    }
}
