//
//  RegisterProtocol.swift
//  Z7M8C9A2
//
//  Created by David Lopez on 09/09/22.
//

import UIKit

protocol RegisterTableViewCellProtocol: ConfigurarCeldaProtocol {}

extension RegisterTableViewCellProtocol {
    
    static func register(tableView: UITableView) {
        tableView.register(nib, forCellReuseIdentifier: identifier)
    }
    
    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
}

extension UITableView {
    func deque<T: RegisterTableViewCellProtocol>(atIndexPath: IndexPath) -> T {
        return self.dequeueReusableCell(withIdentifier: T.identifier, for: atIndexPath) as! T
    }
}

extension UITableViewCell: RegisterTableViewCellProtocol { }
