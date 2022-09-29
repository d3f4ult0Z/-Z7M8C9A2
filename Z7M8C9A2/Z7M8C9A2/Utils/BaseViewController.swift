//
//  BaseViewController.swift
//  Z7M8C9A2
//
//  Created by David Lopez on 29/09/22.
//

import Foundation
import UIKit

class BaseViewController: UIViewController {
    
    
    
    
    func alerta(mensaje: String?, handler: ((_ action: UIAlertAction) -> Void)? = nil) {
        let alert = UIAlertController(title: "Z7M8C9A2", message: mensaje, preferredStyle: .alert)
        let action = UIAlertAction(title: "Aceptar", style: .default, handler: handler)
        alert.addAction(action)
        alert.view.tintColor = #colorLiteral(red: 0.00800000038, green: 0.5839999914, blue: 0.8309999704, alpha: 1)
        self.present(alert, animated: true)
    }
    

    
}
