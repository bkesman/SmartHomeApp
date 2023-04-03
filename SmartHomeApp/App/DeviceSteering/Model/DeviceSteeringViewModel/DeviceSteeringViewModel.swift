//
//  DeviceSteeringViewModel.swift
//  SmartHomeApp
//
//  Created by Berkan Kesman on 04/04/2023.
//

import Foundation

enum DeviceSteeringViewModel {
    case lightSteeringViewModel(LightSteeringViewModel)
    case heaterSteeringViewModel(HeaterSteeringViewModel)
    case rollerShutterSteeringViewModel(RollerShutterSteeringViewModel)
}
