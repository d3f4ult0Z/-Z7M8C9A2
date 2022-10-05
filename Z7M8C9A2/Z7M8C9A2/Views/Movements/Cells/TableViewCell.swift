//
//  TableViewCell.swift
//  Z7M8C9A2
//
//  Created by Guillermo Matos on 04/10/22.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var imagen: UIImageView!
    
    @IBOutlet weak var movimientoTypeLabel: UILabel!
    
    @IBOutlet weak var montoLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        //imagen.image = UIImage(named: "slide1")
    }
    
    
    
}
