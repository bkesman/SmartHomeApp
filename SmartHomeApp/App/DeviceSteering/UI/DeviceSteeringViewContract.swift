//
//  DeviceSteeringViewContract.swift
//  SmartHomeApp
//
//  Created by Berkan Kesman on 02/04/2023.
//

import Foundation

protocol DeviceSteeringViewContract: AnyObject {
    func display(with viewModel: DeviceSteeringViewModel)
}
