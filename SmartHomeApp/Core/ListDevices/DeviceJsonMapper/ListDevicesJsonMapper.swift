//
//  ListDevicesJsonMapper.swift
//  SmartHomeApp
//
//  Created by Berkan Kesman on 02/04/2023.
//

import Foundation

struct ListDevicesJsonMapper {
    
    func map(listDevicesJson: ListDevicesJson) ->  ListDevices {
        return ListDevices(devices: mapDevices(devicesJson: listDevicesJson.devices))
    }
    
    func mapDevices(devicesJson: [DeviceJson]) -> [Device] {
        devicesJson.compactMap { deviceJson in
            var mode: Mode?
            switch deviceJson.mode {
            case "OFF":
                mode = .Off
            case "ON":
                mode = .On
            default:
                break
            }
            switch deviceJson.productType {
            case "Light":
                return mapDevice(deviceJson: deviceJson, mode: mode, productType: .Light)
            case "RollerShutter":
                return mapDevice(deviceJson: deviceJson, mode: mode, productType: .RollerShutter)
            case "Heater":
                return mapDevice(deviceJson: deviceJson, mode: mode, productType: .Heater)
            default:
                return nil
            }
        }
    }
    
    func mapDevice(deviceJson: DeviceJson, mode: Mode?, productType: ProductType) -> Device {
        return Device(id: deviceJson.id,
                      deviceName: deviceJson.deviceName,
                      intensity: deviceJson.intensity,
                      mode: mode,
                      temperature: deviceJson.temperature,
                      position: deviceJson.position,
                      productType: productType)
    }
}
