//
//  ListDevicesPresenter.swift
//  SmartHomeApp
//
//  Created by Berkan Kesman on 01/04/2023.
//

import Foundation

protocol ListDevicesPresenter {
    func start()
    func didSelectDevice(with id: Int)
}

protocol ListDevicesPresenterDelegate: AnyObject {
    func didSelect(device: Device)
}
