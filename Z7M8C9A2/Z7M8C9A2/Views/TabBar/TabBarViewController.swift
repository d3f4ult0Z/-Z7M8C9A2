//
//  TabBarViewController.swift
//  Z7M8C9A2
//
//  Created by Montse Contreras on 08/09/22.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    func setup(){
        
        let primeravista = HomeViewController()
        let segundavista = AbstractViewController()
        let terceravista = AcountViewController()
        let cuartavista = ConfigurationViewController()
        let quintavista = MovimientoViewController()

        
        primeravista.title = "Home"
        segundavista.title = "Resumen"
        terceravista.title = "Cuentas"
        cuartavista.title = "Configuración"
        quintavista.title = "movimientos"
        
        
        
        
        
        
        
        self.setViewControllers([primeravista, segundavista, terceravista, cuartavista, quintavista], animated: false)
        
        guard let items = self.tabBar.items else { return }
        
        let images = [ "house","doc.plaintext.fill","person.fill", "gearshape.fill" ,"house"]
        
        for x in 0...4{
            items[x].image = UIImage(systemName: images[x])
        }
        
        
        self.tabBar.backgroundColor = UIColor.systemBackground
        self.tabBar.tintColor = UIColor.systemBlue
    }
    

}
