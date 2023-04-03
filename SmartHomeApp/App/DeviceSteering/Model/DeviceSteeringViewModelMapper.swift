//TODO: Implement case heater and rollershutter
//  DeviceSteeringViewModelMapper.swift
//  SmartHomeApp
//
//  Created by Berkan Kesman on 02/04/2023.
//

import Foundation

struct DeviceSteeringViewModelMapper {
    
    func map(device: Device) -> DeviceSteeringViewModel {
        switch device.productType {
        case .light(var lightProduct):
            return .lightSteeringViewModel(LightSteeringViewModel(mode: lightProduct.mode,
                                                                                          modeTitle: "Turn the device ON/OFF",
                                                                                          intensityTitle: "Intensity",
                                                                                          intensity: lightProduct.intensity))
        case .heater(let heaterProduct):
            return .heaterSteeringViewModel(HeaterSteeringViewModel())
        case .rollerShutter(let rollerShutterProduct):
            return .rollerShutterSteeringViewModel(RollerShutterSteeringViewModel())
        }
    }
}
