//
//  ListDevicesTableViewDataSource.swift
//  SmartHomeApp
//
//  Created by Berkan Kesman on 02/04/2023.
//

import Foundation
import UIKit

protocol ListDevicesTableViewDataSourceDelegate {
}

class ListDevicesTableViewDataSource: NSObject,
                                              UITableViewDataSource,
                                              UITableViewDelegate {
    
    var delegate: ListDevicesTableViewDataSourceDelegate?
    var viewModels: ListDevicesViewModel = .empty
    
    func configure(_ tableView: UITableView, with viewModels: ListDevicesViewModel) {
        self.viewModels = viewModels
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels.devices.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->
    UITableViewCell {
        return UITableViewCell()
    }
}
