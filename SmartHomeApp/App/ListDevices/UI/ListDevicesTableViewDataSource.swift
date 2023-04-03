//
//  ListDevicesTableViewDataSource.swift
//  SmartHomeApp
//
//  Created by Berkan Kesman on 02/04/2023.
//

import Foundation
import UIKit

protocol ListDevicesTableViewDataSourceDelegate {
    func listDevicesTableViewDataSource(_ dataSource: ListDevicesTableViewDataSource,
                                        didSelectRowWithIndexPath indexPath: IndexPath,
                                        with id: Int)
}

class ListDevicesTableViewDataSource: NSObject,
                                              UITableViewDataSource,
                                              UITableViewDelegate {
    
    var delegate: ListDevicesTableViewDataSourceDelegate?
    var viewModels: ListDevicesViewModel = .empty
    
    func configure(_ tableView: UITableView, with viewModels: ListDevicesViewModel) {
        self.viewModels = viewModels
        tableView.reloadData()
        tableView.register(DeviceTableViewCell.self, forCellReuseIdentifier: "Device")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels.devices.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->
    UITableViewCell {
        let viewModel = viewModels.devices[indexPath.row]
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: "Device", for: indexPath) as? DeviceTableViewCell else {
            fatalError("Unexpected dequeued cell")
        }
        cell.configure(with: viewModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.listDevicesTableViewDataSource(self,
                                                 didSelectRowWithIndexPath: indexPath,
                                                 with: viewModels.devices[indexPath.row].id)
    }
}
