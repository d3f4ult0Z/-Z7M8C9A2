//
//  HomeViewController.swift
//  Z7M8C9A2
//
//  Created by Montse Contreras on 08/09/22.
//

import UIKit

class HomeViewController: BaseViewController {
    
    @IBOutlet weak var lblHome: UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Test Code
        self.loading = true
        self.lblHome.isHidden = true
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2){
            self.loading = false
            self.lblHome.isHidden = false
        }
        
    }


  

}
