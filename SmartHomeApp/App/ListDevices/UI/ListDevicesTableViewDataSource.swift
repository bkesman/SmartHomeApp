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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->
    UITableViewCell {
        return UITableViewCell()
    }
}
