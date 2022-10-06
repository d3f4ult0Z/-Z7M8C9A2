//
//  AbstractViewController.swift
//  Z7M8C9A2
//
//  Created by Montse Contreras on 09/09/22.
//

import UIKit

class AbstractViewController: BaseViewController {
    
    @IBOutlet weak var lblAbstract: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.loading = true
        self.lblAbstract.isHidden = true
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2){
            self.loading = false
            self.lblAbstract.isHidden = false
        }
    }



}
