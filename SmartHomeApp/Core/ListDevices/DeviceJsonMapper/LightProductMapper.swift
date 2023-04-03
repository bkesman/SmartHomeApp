//
//  LightProductMapper.swift
//  SmartHomeApp
//
//  Created by Berkan Kesman on 03/04/2023.
//

import Foundation

struct LightProductMapper {
    func map(device: Device) -> DeviceJson {
        switch device.productType {
        case .heater(let heaterProduct):
            return DeviceJson(id: device.id,
                              deviceName: device.deviceName,
                              intensity: nil,
                              mode: heaterProduct.mode.toString(),
                              temperature: heaterProduct.temperature,
                              position: nil,
                              productType: device.productType.toString())
        case .light(let lightProduct):
            return DeviceJson(id: device.id,
                              deviceName: device.deviceName,
                              intensity: lightProduct.intensity,
                              mode: lightProduct.mode.toString(),
                              temperature: nil,
                              position: nil,
                              productType: device.productType.toString())
        case .rollerShutter(let rollerShutter):
            return DeviceJson(id: device.id,
                              deviceName: device.deviceName,
                              intensity: nil,
                              mode: nil,
                              temperature: nil,
                              position: rollerShutter.position,
                              productType: device.productType.toString())
        }
    }
 }
