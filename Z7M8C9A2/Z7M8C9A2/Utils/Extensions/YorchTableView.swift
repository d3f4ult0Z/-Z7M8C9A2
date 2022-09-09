//
//  YorchTableView.swift
//  Z7M8C9A2
//
//  Created by David Lopez on 09/09/22.
//

import UIKit

protocol RefreshTableViewProtocol: AnyObject {
    func refresh(tableView: UITableView)
}

class YorchTableView: UITableView {

    var refreshDelegate: RefreshTableViewProtocol? {
        didSet {
            if let _ = self.refreshDelegate {
                self.addRefreshControl()
            } else {
                self.refreshControl = nil
            }
        }
    }
    
    override func reloadData() {
        UIView.transition(with: self, duration: 0.3, options: .transitionCrossDissolve, animations: {
            super.reloadData()
        }, completion: nil)
    }

    override func draw(_ rect: CGRect) {
        super.draw(rect)
    }
    
    func addRefreshControl() {
        let refresh = UIRefreshControl()
        refresh.addTarget(self, action: #selector(refresh(tableView:)), for: .valueChanged)
        refresh.tintColor = UIColor(named: "backgroundButtonColor")
        self.refreshControl = refresh
    }
    
    @objc func refresh(tableView: UITableView) {
        self.refreshControl?.beginRefreshing()
        self.refreshDelegate?.refresh(tableView: self)
    }
    
}
