//
//  RegisterViewController.swift
//  Z7M8C9A2
//
//  Created by Montse Contreras on 06/09/22.
//

import UIKit

class RegisterViewController: UIViewController {
    @IBOutlet weak var btnRegistroApple: UIButton!
    
    @IBOutlet weak var btnRegistroFacebook: UIButton!
    @IBOutlet weak var btnRegistroGoogle: UIButton!
    @IBOutlet weak var lblYaTienesCuenta: UILabel!
    @IBOutlet weak var btnRegistroFormulario: UIButton!
    @IBOutlet weak var btnEntrarInvitado: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    func setup() {
        btnRegistroApple.layer.borderWidth = 1
        btnRegistroApple.layer.cornerRadius = 5;
        btnRegistroApple.layer.borderColor = UIColor.black.cgColor
        btnRegistroApple.backgroundColor = .black
        

        btnRegistroFacebook.layer.cornerRadius = 5;
    
        btnRegistroGoogle.layer.cornerRadius = 5;
     
        btnRegistroFormulario.layer.cornerRadius = 5;
        
        UserDefaults().set(true, forKey: "ViewOnboard")
    }

    @IBAction func ActionEntrarInvitado(_ sender: Any) {
        self.navigationController?.pushViewController(TabBarViewController(), animated: true)
    }
   
    @IBAction func btnRegistroApple(_ sender: Any) {
    }
    
    @IBAction func actionRegistroFormulario(_ sender: Any) {
        self.navigationController?.pushViewController(RegisterFormViewController(), animated: true)
    }
    
}
