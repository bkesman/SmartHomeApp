//
//  ListDevicesViewController.swift
//  SmartHomeApp
//
//  Created by Berkan Kesman on 01/04/2023.
//

import Foundation
import UIKit

class ListDevicesViewController: UIViewController,
                                 ListDevicesViewContract {
    
    public var presenter: ListDevicesPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.start()
        setUp()
    }
    
    private func setUp() {
    }
}

