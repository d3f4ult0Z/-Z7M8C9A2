//
//  Movimientos.swift
//  Z7M8C9A2
//
//  Created by Guillermo Matos on 04/10/22.
//

import UIKit

public struct Movimientos {
    
    let tipoMovimiento : String
    let monto : Double
    let fecha : String
    let imagen : String
    
    init(tipoMovimiento: String, monto: Double, fecha: String, imagen: String) {
        self.tipoMovimiento = tipoMovimiento
        self.monto = monto
        self.fecha = fecha
        self.imagen = imagen
    }
    

}
