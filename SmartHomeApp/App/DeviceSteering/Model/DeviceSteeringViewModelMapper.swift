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
                                                                  modeTitle: NSLocalizedString("switch_mode_title", comment: ""),
                                                                  intensityTitle: NSLocalizedString("intensity_title", comment: ""),
                                                                  intensityValue: lightProduct.intensity,
                                                                  intensityValueTitle: String.localizedStringWithFormat(NSLocalizedString("intensity_value_title", comment: ""), lightProduct.intensity)))
        case .heater(let heaterProduct):
            return .heaterSteeringViewModel(HeaterSteeringViewModel())
        case .rollerShutter(let rollerShutterProduct):
            return .rollerShutterSteeringViewModel(RollerShutterSteeringViewModel(positionTitle: NSLocalizedString("position_title",
                                                                                                                   comment: ""),
                                                                                  positionValue: rollerShutterProduct.position,
                                                                                  positionValueTitle: String.localizedStringWithFormat(NSLocalizedString("position_value_title", comment: ""), rollerShutterProduct.position)))
        }
    }
}
