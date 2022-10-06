//
//  ConfigurationViewController.swift
//  Z7M8C9A2
//
//  Created by David Lopez on 09/09/22.
//

import UIKit

class ConfigurationViewController: BaseViewController {
    
    
    @IBOutlet weak var tableView: YorchTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableViewSetup()
        self.navigationController?.isNavigationBarHidden = true
        // Test Code
        self.loading = true
        self.tableView.isHidden = true
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2){
            self.loading = false
            self.tableView.isHidden = false
        }
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    func tableViewSetup() {
        
        
        ProfileTableViewCell.register(tableView: self.tableView)
        EditUserDataTableViewCell.register(tableView: self.tableView)
        PrivacyTableViewCell.register(tableView: self.tableView)
        LocationTableViewCell.register(tableView: self.tableView)
        LogOutTableViewCell.register(tableView: self.tableView)
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.separatorStyle = .none
        
    }


}

extension ConfigurationViewController:  UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 4
        default:
            return 0
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch (indexPath.section, indexPath.row) {
        case (0, 0):
            let perfil: ProfileTableViewCell = tableView.deque(atIndexPath: indexPath)
            perfil.selectionStyle = .none
            return perfil

        case (1, 0):
            let modificardatos: EditUserDataTableViewCell = tableView.deque(atIndexPath: indexPath)
            modificardatos.selectionStyle = .none
            return  modificardatos
        case (1, 1):
            let politicas: PrivacyTableViewCell = tableView.deque(atIndexPath: indexPath)
            politicas.selectionStyle = .none
            return  politicas
        case (1, 2):
            let ubicaciones: LocationTableViewCell = tableView.deque(atIndexPath: indexPath)
            ubicaciones.selectionStyle = .none
            return  ubicaciones
        case (1, 3):
            let cerrarsesion: LogOutTableViewCell = tableView.deque(atIndexPath: indexPath)
            cerrarsesion.selectionStyle = .none
            return  cerrarsesion
                    
        default:
            return UITableViewCell()
        }
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
            switch (indexPath.section, indexPath.row) {
            
            case (1, 0):
                self.navigationController?.pushViewController(EditUserDataViewController(), animated: true)
                
            case (1, 1):
                self.navigationController?.pushViewController(EditUserDataViewController(), animated: true)
                
            case (1, 2):
                self.navigationController?.pushViewController(EditUserDataViewController(), animated: true)
                
            case (1, 3):
                self.navigationController?.popToRootViewController(animated: true)
        
            default:
                return
            
        }
    }
    
    
    
}
