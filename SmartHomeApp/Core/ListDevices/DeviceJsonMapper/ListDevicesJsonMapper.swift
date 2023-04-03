//
//  ListDevicesJsonMapper.swift
//  SmartHomeApp
//
//  Created by Berkan Kesman on 02/04/2023.
//

import Foundation

struct ListDevicesJsonMapper {
    
    func map(listDevicesJson: ListDevicesJson) ->  ListDevices {
        var listDevices = ListDevices(devices: [])
        for deviceJson in listDevicesJson.devices {
            switch deviceJson.productType {
            case ProductType.light(LightProduct(intensity: 0, mode: .Off)).toString():
                guard let lightProduct = mapLightProduct(deviceJson: deviceJson) else {
                    break
                }
                listDevices.devices.append(Device(id: deviceJson.id,
                                                  deviceName: deviceJson.deviceName,
                                                  productType: .light(lightProduct)))
                
            case ProductType.rollerShutter(RollerShutterProduct(position: 0)).toString():
                guard let rollerShutterProduct = mapRollerShutterProduct(deviceJson: deviceJson) else {
                    break
                }
                listDevices.devices.append(Device(id: deviceJson.id,
                                                  deviceName: deviceJson.deviceName,
                                                  productType:  .rollerShutter(rollerShutterProduct)))
            case ProductType.heater(HeaterProduct(mode: .Off, temperature: 0)).toString():
                guard let heaterProduct = mapHeaterProduct(deviceJson: deviceJson) else {
                    break
                }
                listDevices.devices.append(Device(id: deviceJson.id,
                                                  deviceName: deviceJson.deviceName,
                                                  productType: .heater(heaterProduct)))
            default:
                break
            }
        }
        return listDevices
    }
    
    private func mapLightProduct(deviceJson: DeviceJson) -> LightProduct? {
        guard let modeString = deviceJson.mode,
              let mode = mapMode(modeString: modeString),
              let intensity = deviceJson.intensity else {
            return nil
        }
        return LightProduct(intensity: intensity,
                            mode: mode)
    }
    
    private func mapRollerShutterProduct(deviceJson: DeviceJson) -> RollerShutterProduct? {
        guard let position = deviceJson.position else {
            return nil
        }
        return RollerShutterProduct(position: position)
    }
    
    private func mapHeaterProduct(deviceJson: DeviceJson) -> HeaterProduct? {
        guard let modeString = deviceJson.mode,
              let mode = mapMode(modeString: modeString),
              let temperature = deviceJson.temperature else {
            return nil
        }
        return HeaterProduct(mode: mode,
                             temperature: temperature)
    }
    
    private func mapMode(modeString: String) -> Mode? {
        switch modeString {
        case "ON":
            return .On
        case "OFF":
            return .Off
        default:
            return nil
        }
    }
}
