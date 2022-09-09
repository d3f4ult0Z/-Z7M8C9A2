//
//  AcountViewController.swift
//  Z7M8C9A2
//
//  Created by Montse Contreras on 09/09/22.
//

import UIKit

class AcountViewController: UIViewController {

    @IBOutlet weak var tableViewDatos: YorchTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableViewSetup()

    }
    
    func tableViewSetup(){
        
        DataTableViewCell.register(tableView: self.tableViewDatos)
        ProfileTableViewCell.register(tableView: self.tableViewDatos)
        
        self.tableViewDatos.delegate = self
        self.tableViewDatos.dataSource = self
        self.tableViewDatos.separatorStyle = .none
    }


}
extension AcountViewController : UITableViewDataSource, UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 1
        case 2:
            return 1
        case 3:
            return 1
        default:
            return 0
        }
        
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch(indexPath.section, indexPath.row){
            case (0, 0):
            let conntante: DataTableViewCell = tableView.deque(atIndexPath: indexPath)
            conntante.selectionStyle = .none
            return conntante
            
            case (1, 0):
            let conntante: DataTableViewCell = tableView.deque(atIndexPath: indexPath)
            conntante.selectionStyle = .none
            return conntante
            
            case (2, 0):
            let hola: DataTableViewCell = tableView.deque(atIndexPath: indexPath)
            hola.selectionStyle = .none
            return hola
            
            case (3, 0):
            let conntante: DataTableViewCell = tableView.deque(atIndexPath: indexPath)
            conntante.selectionStyle = .none
            return conntante
                
        default:
            return UITableViewCell()
        }
        
    }
    
}

