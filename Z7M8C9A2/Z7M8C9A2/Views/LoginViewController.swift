//
//  LoginViewController.swift
//  Z7M8C9A2
//
//  Created by Montse Contreras on 05/09/22.
//

import UIKit
import Alamofire

class LoginViewController: BaseViewController {

    @IBOutlet weak var btnCrearCuenta: UIButton!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var txtUser: UITextField!
    @IBOutlet weak var txtPass: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func actionCrearCuenta(_ sender: Any) {
        self.navigationController?.pushViewController(RegisterViewController(), animated: true)
    }
    
    
    @IBAction func actionLogin(_ sender: Any) {
       
        guard let usuario = txtUser.text, !usuario.isEmpty else {
            self.alerta(mensaje: "Por favor agregue su usuario")
            return
        }
        
        guard let password = txtPass.text, !password.isEmpty else {
            self.alerta(mensaje: "Por favor agregue su contraseña")
            return
        }
        
        API.login(user: usuario, pass: password).request(model: LoginResponse.self, handler: {response,error,statusCode in
            
            if let response=response {
                if response.success == true {
                    self.navigationController?.pushViewController(TabBarViewController(), animated: true)
                } else {
                    self.alerta(mensaje: response.mensaje)
                }
            }
            
            if let error=error {
                self.alerta(mensaje: error)
            }
        })
    
        
        

    }
    
    
    
}
