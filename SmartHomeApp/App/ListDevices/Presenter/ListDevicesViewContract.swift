//
//  ListDevicesViewContract.swift
//  SmartHomeApp
//
//  Created by Berkan Kesman on 01/04/2023.
//

import Foundation

protocol ListDevicesViewContract: AnyObject {
    func display(viewModels: ListDevicesViewModel)
}
