//
//  MovimientoViewController.swift
//  Z7M8C9A2
//
//  Created by Guillermo Matos on 04/10/22.
//

import UIKit

class MovimientoViewController: UIViewController {
    
    var movimientos = [Movimientos]()
    let startDate = Date()
    let formatter = DateFormatter()
    var calendar = Calendar.current

    @IBOutlet weak var tableView: YorchTableView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        TableViewCell.register(tableView: self.tableView)
        
        tableView.dataSource = self
        tableView.delegate = self
        
        formatter.dateFormat = "MM/dd/yyyy"
        llenarMovimientos()
        

        // Do any additional setup after loading the view.
    }
    func llenarMovimientos(){

    for i in 0...50{
        
        var moveType = ""
        
        if i%2 == 0 {
            moveType = "Ingreso"
        }
        else {
            moveType = "Egreso"
        }
        let numDias = -1*i
        let date = calendar.date(byAdding: .day, value: numDias, to: startDate)!
        let dateString = formatter.string(from: date)
        let imageArray = ["monedas1","monedas2","monedas3"]
        guard let imageName = imageArray.randomElement() else { return  }

        movimientos.append(Movimientos(tipoMovimiento: moveType, monto:Double(Int.random(in: 50...10000)), fecha: dateString, imagen: imageName))

    }

    }

}



extension MovimientoViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movimientos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: TableViewCell = tableView.deque(atIndexPath: indexPath)
        
        let movimientosTable = movimientos[indexPath.row]
        
        cell.movimientoTypeLabel?.text = movimientosTable.tipoMovimiento
        cell.montoLabel?.text = "\(movimientosTable.monto)"
        cell.dateLabel?.text = movimientosTable.fecha
        cell.imagen.image = UIImage(named: movimientosTable.imagen)
        
        if movimientosTable.tipoMovimiento == "Ingreso"{
            cell.montoLabel?.textColor = .green
        }
        else {
            cell.montoLabel?.textColor = .red
        }
        
            
            return cell

    }
    
    
}


extension MovimientoViewController: UITableViewDelegate {
    
}
