//
//  DeviceSteeringPresenter.swift
//  SmartHomeApp
//
//  Created by Berkan Kesman on 02/04/2023.
//

import Foundation

protocol DeviceSteeringPresenter {
    func start()
    func didChangeIntensityValue(newValue: Int)
    func didChangePower(newValue: Bool)
}

protocol DeviceSteeringPresenterDelegate: AnyObject {
}
