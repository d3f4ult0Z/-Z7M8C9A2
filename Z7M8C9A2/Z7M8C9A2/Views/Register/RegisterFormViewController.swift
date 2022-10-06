//
//  RegisterFormViewController.swift
//  Z7M8C9A2
//
//  Created by Montse Contreras on 06/09/22.
//

import UIKit

class RegisterFormViewController: BaseViewController {

    @IBOutlet weak var lblUsuario: UITextField!
    @IBOutlet weak var lblMail: UITextField!
    @IBOutlet weak var lblNombreCompleto: UITextField!
    @IBOutlet weak var TextFieldNumero: UITextField!
    
    @IBOutlet weak var textFieldRepetirContraseña: UITextField!
    @IBOutlet weak var textFieldContraseña: UITextField!
    @IBOutlet weak var btnRegistrar: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
    }

    @IBAction func actionBtnRegistrar(_ sender: Any) {
        
        guard let usuario = lblUsuario.text, !usuario.isEmpty else{
            self.alerta(mensaje: "Por favor agregue su usuario")
            return
        }
        guard let mail = lblMail.text, !mail.isEmpty else{
            self.alerta(mensaje: "Por favor agregue su mail")
            return
        }
        guard let nombreCompleto = lblNombreCompleto.text, !nombreCompleto.isEmpty else{
            self.alerta(mensaje: "Por favor agregue su nombre completo")
            return
        }
        guard let numero = TextFieldNumero.text, !numero.isEmpty else{
            self.alerta(mensaje: "Por favor agregue su número")
            return
        }
        guard let contraseña = textFieldContraseña.text, !contraseña.isEmpty else{
            self.alerta(mensaje: "Por favor agregue su contraseña")
            return
        }
        guard let repetirContraseña = textFieldRepetirContraseña.text, repetirContraseña == contraseña else {
            self.alerta(mensaje: "Verifica que las contraseñas sean iguales")
            return
        }
        self.loading = true
        API.register(user: usuario, mail: mail, name: nombreCompleto, phone: numero, pass: contraseña).request(model: RegisterResponse.self, handler: {response,error,statusCode in
            self.loading = false
            if let response = response {
                if response.success == true{
                    self.alerta(mensaje: response.mensaje, handler: {_ in
                        self.navigationController?.popViewController(animated: true)
                    })
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
