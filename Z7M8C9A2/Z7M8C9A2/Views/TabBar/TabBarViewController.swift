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
    
    func setup(){
        let primeravista = AcountViewController()
        let segundavista = HomeViewController()
        let terceravista = ConfigurationViewController()
        
        primeravista.title = "Cuentas"
        segundavista.title = "Home"
        terceravista.title = "Configuración"
        
        self.setViewControllers([primeravista, segundavista, terceravista], animated: false)
        
        guard let items = self.tabBar.items else { return }
        
        let images = [ "person.fill", "house", "gearshape.fill"]
        
        for x in 0...2{
            items[x].image = UIImage(systemName: images[x])
        }
        
        
        self.tabBar.backgroundColor = .white
        self.tabBar.tintColor = .black
    }
    

}
