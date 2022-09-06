//
//  LoginViewController.swift
//  Z7M8C9A2
//
//  Created by Montse Contreras on 05/09/22.
//

import UIKit
import Alamofire

class LoginViewController: UIViewController {

    @IBOutlet weak var btnCrearCuenta: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func actionCrearCuenta(_ sender: Any) {
        self.navigationController?.pushViewController(RegisterViewController(), animated: true)
    }
    
}
