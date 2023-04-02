//
//  ListDevicesViewModelMapper.swift
//  SmartHomeApp
//
//  Created by Berkan Kesman on 01/04/2023.
//

import Foundation

struct ListDevicesViewModelMapper {
    
    func map(listDevices: ListDevices) -> ListDevicesViewModel {
        
        let heaters = mapHeaters(heaters: listDevices.heaters)
        let lights = mapLights(lights: listDevices.lights)
        let rollerShutters = mapRollerShutters(rollerShutters: listDevices.rollerShutters)
        
        return ListDevicesViewModel(devices: heaters+lights+rollerShutters)
    }
    
    private func mapHeaters(heaters: [HeaterProduct]) -> [DeviceViewModel] {
        heaters.compactMap { heaterProduct in
            return mapHeater(heaterProduct: heaterProduct)
        }
    }
    
    private func mapHeater(heaterProduct: HeaterProduct)  -> DeviceViewModel {
        switch heaterProduct.mode {
        case .On:
            return DeviceViewModel(id: heaterProduct.id,
                                   deviceName: heaterProduct.deviceName,
                                   currentState: "On at \(heaterProduct.temperature)°C",
                                   currentStateIcon: .deviceHeaterOnIcon,
                                   isWorking: true,
                                   productType: .heater)
        case .Off:
            return DeviceViewModel(id: heaterProduct.id,
                                   deviceName: heaterProduct.deviceName,
                                   currentState: "Off",
                                   currentStateIcon: .deviceHeaterOffIcon,
                                   isWorking: false,
                                   productType: .heater)
        }
    }

    private func mapLights(lights: [LightProduct]) -> [DeviceViewModel] {
        lights.compactMap { lightProduct in
            return mapLight(lightProduct: lightProduct)
        }
    }
    
    private func mapLight(lightProduct: LightProduct) -> DeviceViewModel {
        switch lightProduct.mode {
        case .On:
            return DeviceViewModel(id: lightProduct.id,
                                   deviceName: lightProduct.deviceName,
                                   currentState: "ON",
                                   currentStateIcon: .deviceLightOnIcon,
                                   isWorking: true,
                                   productType: .light)
        case .Off:
            return DeviceViewModel(id: lightProduct.id,
                                   deviceName: lightProduct.deviceName,
                                   currentState: "OFF",
                                   currentStateIcon: .deviceLightOffIcon,
                                   isWorking: false,
                                   productType: .light)
        }
    }
    
    private func mapRollerShutters(rollerShutters: [RollerShutterProduct]) -> [DeviceViewModel] {
        rollerShutters.compactMap { rollerShutterProduct in
            return mapRollerShutter(rollerShutterProduct: rollerShutterProduct)
        }
    }
    
    private func mapRollerShutter(rollerShutterProduct: RollerShutterProduct) -> DeviceViewModel? {
        switch rollerShutterProduct.position {
        case 0:
            return DeviceViewModel(id: rollerShutterProduct.id,
                                   deviceName: rollerShutterProduct.deviceName,
                                   currentState: "Closed",
                                   currentStateIcon: .deviceRollerShutterIcon,
                                   isWorking: false,
                                   productType: .rollerShutter)
        case 1...99:
            return DeviceViewModel(id: rollerShutterProduct.id,
                                   deviceName: rollerShutterProduct.deviceName,
                                   currentState: "Opened at \(rollerShutterProduct.position)%",
                                   currentStateIcon: .deviceRollerShutterIcon,
                                   isWorking: true,
                                   productType: .rollerShutter)
        case 100:
            return DeviceViewModel(id: rollerShutterProduct.id,
                                   deviceName: rollerShutterProduct.deviceName,
                                   currentState: "Opened",
                                   currentStateIcon: .deviceRollerShutterIcon,
                                   isWorking: true,
                                   productType: .rollerShutter)
        default: return nil
        }
    }
}
