//
//  RegisterViewController.swift
//  Z7M8C9A2
//
//  Created by Montse Contreras on 06/09/22.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var btnRegistroFormulario: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func actionRegistroFormulario(_ sender: Any) {
        self.navigationController?.pushViewController(RegisterFormViewController(), animated: true)
    }
    
}
