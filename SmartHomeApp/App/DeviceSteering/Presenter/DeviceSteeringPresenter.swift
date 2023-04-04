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
    func didRequestNewIntensityValue(newValue: Int)
    func didChangePower(newValue: Bool)
    func didChangePositionValue(newValue: Int)
    func didRequestNewPositionValue(newValue: Int)
}

protocol DeviceSteeringPresenterDelegate: AnyObject {
}
