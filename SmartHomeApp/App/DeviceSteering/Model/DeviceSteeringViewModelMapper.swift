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
        case .light(let lightProduct):
            return .lightSteeringViewModel(LightSteeringViewModel(mode: lightProduct.mode,
                                                                  modeTitle: "Turn the device ON/OFF",
                                                                  intensityTitle: "Intensity",
                                                                  intensityValue: lightProduct.intensity,
                                                                  intensityValueTitle: "\(lightProduct.intensity)%"))
        case .heater(let heaterProduct):
            return .heaterSteeringViewModel(HeaterSteeringViewModel())
        case .rollerShutter(let rollerShutterProduct):
            return .rollerShutterSteeringViewModel(RollerShutterSteeringViewModel(positionTitle: "Position",
                                                                                  positionValue: rollerShutterProduct.position,
                                                                                  positionValueTitle: "\(rollerShutterProduct.position)%"))
        }
    }
}
