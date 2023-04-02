//
//  ListDevicesViewModelMapper.swift
//  SmartHomeApp
//
//  Created by Berkan Kesman on 01/04/2023.
//

import Foundation

struct ListDevicesViewModelMapper {

    func map(listDevices: ListDevices) -> ListDevicesViewModel {
        return ListDevicesViewModel(devices: mapDevices(devices: listDevices.devices))
    }
    
    private func mapDevices(devices: [Device]) -> [DeviceViewModel] {
        devices.compactMap { device in
            switch device.productType {
            case .Light:
                return mapLight(device: device)
            case .RollerShutter:
                return mapRollerShutter(device: device)
            case .Heater:
                return mapHeater(device: device)
            }
        }
    }
    
    private func mapLight(device: Device) -> DeviceViewModel? {
        switch device.mode {
        case .On:
            return DeviceViewModel(deviceName: device.deviceName,
                                   currentState: "ON",
                                   currentStateIcon: .deviceLightOnIcon,
                                   isWorking: true)
        case .Off:
            return DeviceViewModel(deviceName: device.deviceName,
                                   currentState: "OFF",
                                   currentStateIcon: .deviceLightOffIcon,
                                   isWorking: false)
        case nil:
            return nil
        }
    }
    
    private func mapRollerShutter(device: Device) -> DeviceViewModel? {
        guard let position = device.position else {
            return nil
        }
        switch position {
        case 0:
            return DeviceViewModel(deviceName: device.deviceName,
                                   currentState: "Closed",
                                   currentStateIcon: .deviceRollerShutterIcon,
                                   isWorking: false)
        case 1...99:
            return DeviceViewModel(deviceName: device.deviceName,
                                   currentState: "Opened at \(position)%",
                                   currentStateIcon: .deviceRollerShutterIcon,
                                   isWorking: true)
        case 100:
            return DeviceViewModel(deviceName: device.deviceName,
                                   currentState: "Opened",
                                   currentStateIcon: .deviceRollerShutterIcon,
                                   isWorking: true)
        default:
            return nil
        }
    }
    
    private func mapHeater(device: Device)  -> DeviceViewModel? {
        guard let temperature = device.temperature else {
            return nil
        }
        switch device.mode {
        case .On:
            return DeviceViewModel(deviceName: device.deviceName,
                                   currentState: "On at \(temperature)°C",
                                   currentStateIcon: .deviceHeaterOnIcon,
                                   isWorking: true)
        case .Off:
            return DeviceViewModel(deviceName: device.deviceName,
                                   currentState: "Off",
                                   currentStateIcon: .deviceHeaterOffIcon,
                                   isWorking: false)
        case nil:
            return nil
        }
    }
}
