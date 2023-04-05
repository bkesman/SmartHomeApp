//
//  ListDevicesViewModelMapper.swift
//  SmartHomeApp
//
//  Created by Berkan Kesman on 01/04/2023.
//

import Foundation

struct ListDevicesViewModelMapper {
    
    func map(listDevices: ListDevices) -> ListDevicesViewModel {
        
        let devicesViewModel = listDevices.devices.compactMap { device in
            switch device.productType {
            case .heater(let heaterProduct):
                return mapHeater(id: device.id, deviceName: device.deviceName, heaterProduct: heaterProduct)
            case .light(let lightProduct):
                return mapLight(id: device.id, deviceName: device.deviceName, lightProduct: lightProduct)
            case .rollerShutter(let rollerShutterProduct):
                return mapRollerShutter(id: device.id, deviceName: device.deviceName, rollerShutterProduct: rollerShutterProduct)
            }
        }
        return ListDevicesViewModel(devices: devicesViewModel)
    }
    
    private func mapHeater(id: Int, deviceName: String, heaterProduct: HeaterProduct)  -> DeviceViewModel {
        switch heaterProduct.mode {
        case .On:
            return DeviceViewModel(id: id,
                                   deviceName: deviceName,
                                   currentState: String.localizedStringWithFormat(NSLocalizedString("heater_state_on", comment: ""), heaterProduct.temperature),
                                   currentStateIcon: .deviceHeaterOnIcon,
                                   isWorking: true)
        case .Off:
            return DeviceViewModel(id: id,
                                   deviceName: deviceName,
                                   currentState: NSLocalizedString("heater_state_off", comment: ""),
                                   currentStateIcon: .deviceHeaterOffIcon,
                                   isWorking: false)
        }
    }
    
    private func mapLight(id: Int, deviceName: String, lightProduct: LightProduct) -> DeviceViewModel {
        switch lightProduct.mode {
        case .On:
            return DeviceViewModel(id: id,
                                   deviceName: deviceName,
                                   currentState: NSLocalizedString("light_state_on", comment: ""),
                                   currentStateIcon: .deviceLightOnIcon,
                                   isWorking: true)
        case .Off:
            return DeviceViewModel(id: id,
                                   deviceName: deviceName,
                                   currentState: NSLocalizedString("light_state_off", comment: ""),
                                   currentStateIcon: .deviceLightOffIcon,
                                   isWorking: false)
        }
    }
    
    private func mapRollerShutter(id: Int, deviceName: String, rollerShutterProduct: RollerShutterProduct) -> DeviceViewModel? {
        switch rollerShutterProduct.position {
        case 0:
            return DeviceViewModel(id: id,
                                   deviceName: deviceName,
                                   currentState: NSLocalizedString("roller_shutter_state_closed", comment: ""),
                                   currentStateIcon: .deviceRollerShutterIcon,
                                   isWorking: false)
        case 1...99:
            return DeviceViewModel(id: id,
                                   deviceName: deviceName,
                                   currentState: String.localizedStringWithFormat(NSLocalizedString("roller_shutter_state_partially_opened", comment: ""), rollerShutterProduct.position),
                                   currentStateIcon: .deviceRollerShutterIcon,
                                   isWorking: true)
        case 100:
            return DeviceViewModel(id: id,
                                   deviceName: deviceName,
                                   currentState: NSLocalizedString("roller_shutter_state_opened", comment: ""),
                                   currentStateIcon: .deviceRollerShutterIcon,
                                   isWorking: true)
        default: return nil
        }
    }
}
