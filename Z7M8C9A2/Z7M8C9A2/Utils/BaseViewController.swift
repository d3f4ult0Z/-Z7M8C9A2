//
//  BaseViewController.swift
//  Z7M8C9A2
//
//  Created by David Lopez on 29/09/22.
//

import Foundation
import UIKit
import NVActivityIndicatorView

class BaseViewController: UIViewController {
    
    var loaderCustom: NVActivityIndicatorView?
    
    var loading: Bool = false {
        didSet {
            DispatchQueue.main.async { [weak self] in
                self?.view.endEditing(true)
                if self?.loading ?? false {
                    self?.startLoader()
                } else {
                    self?.stopLoader()
                }
                self?.view.isUserInteractionEnabled = !(self?.loading ?? false)
            }
        }
    }
    
    func startLoader() {
        if let loaderNew = self.loaderCustom{
            loaderNew.startAnimating()
        }else{
            let loaderNew = NVActivityIndicatorView(frame: .zero, type: .ballRotateChase, color: .red, padding: 0)
            loaderNew.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(loaderNew)
            NSLayoutConstraint.activate([
                loaderNew.widthAnchor.constraint(equalToConstant: 50),
                loaderNew.heightAnchor.constraint(equalToConstant: 50),
                loaderNew.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                loaderNew.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            ])
            
            loaderNew.startAnimating()
            self.loaderCustom = loaderNew
        }
    }
    
    
    func stopLoader() {
        guard let loaderNew = self.loaderCustom else{ return }
        
        loaderNew.stopAnimating()
    }
    
    func alerta(mensaje: String?, handler: ((_ action: UIAlertAction) -> Void)? = nil) {
        let alert = UIAlertController(title: "Z7M8C9A2", message: mensaje, preferredStyle: .alert)
        let action = UIAlertAction(title: "Aceptar", style: .default, handler: handler)
        alert.addAction(action)
        alert.view.tintColor = #colorLiteral(red: 0.00800000038, green: 0.5839999914, blue: 0.8309999704, alpha: 1)
        self.present(alert, animated: true)
    }
    

    
}
