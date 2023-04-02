//
//  ListDevicesViewController.swift
//  SmartHomeApp
//
//  Created by Berkan Kesman on 01/04/2023.
//

import Foundation
import UIKit

class ListDevicesViewController: UIViewController,
                                 ListDevicesViewContract,
                                 ListDevicesTableViewDataSourceDelegate {
    
    public var presenter: ListDevicesPresenter?
    private lazy var tableView = createTableView()
    private lazy var dataSource = createDataSource()

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.start()
        setUp()
    }
    
    private func createTableView() -> UITableView {
        let tableView = UITableView()
        tableView.dataSource = dataSource
        tableView.delegate = dataSource
        return tableView
    }
    
    private func createDataSource() -> ListDevicesTableViewDataSource {
        let dataSource = ListDevicesTableViewDataSource()
        dataSource.delegate = self
        return dataSource
    }
    
    private func setUp() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
}

