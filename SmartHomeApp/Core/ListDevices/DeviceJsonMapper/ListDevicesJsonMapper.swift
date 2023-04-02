//
//  ListDevicesJsonMapper.swift
//  SmartHomeApp
//
//  Created by Berkan Kesman on 02/04/2023.
//

import Foundation

struct ListDevicesJsonMapper {
    
    func map(listDevicesJson: ListDevicesJson) ->  ListDevices {
        var listDevices = ListDevices(heaters: [], rollerShutters: [], lights: [])
        for deviceJson in listDevicesJson.devices {
            switch deviceJson.productType {
            case "Light":
                guard let lightProduct = mapLightProduct(deviceJson: deviceJson) else {
                    break
                }
                listDevices.lights.append(lightProduct)
            case "RollerShutter":
                guard let rollerShutterProduct = mapRollerShutterProduct(deviceJson: deviceJson) else {
                    break
                }
                listDevices.rollerShutters.append(rollerShutterProduct)
            case "Heater":
                guard let heaterProduct = mapHeaterProduct(deviceJson: deviceJson) else {
                    break
                }
                listDevices.heaters.append(heaterProduct)
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
        return LightProduct(id: deviceJson.id,
                            deviceName: deviceJson.deviceName,
                            intensity: intensity,
                            mode: mode)
    }
    
    private func mapRollerShutterProduct(deviceJson: DeviceJson) -> RollerShutterProduct? {
        guard let position = deviceJson.position else {
            return nil
        }
        return RollerShutterProduct(id: deviceJson.id, deviceName: deviceJson.deviceName, position: position)
    }
    
    private func mapHeaterProduct(deviceJson: DeviceJson) -> HeaterProduct? {
        guard let modeString = deviceJson.mode,
              let mode = mapMode(modeString: modeString),
              let temperature = deviceJson.temperature else {
            return nil
        }
        return HeaterProduct(id: deviceJson.id, deviceName: deviceJson.deviceName, mode: mode, temperature: temperature)
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
