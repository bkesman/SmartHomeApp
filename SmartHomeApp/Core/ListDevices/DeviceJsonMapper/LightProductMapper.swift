//
//  LightProductMapper.swift
//  SmartHomeApp
//
//  Created by Berkan Kesman on 03/04/2023.
//

import Foundation

struct LightProductMapper {
    func map(lightProduct: LightProduct) -> DeviceJson {
        return DeviceJson(id: lightProduct.id,
                          deviceName: lightProduct.deviceName,
                          intensity: lightProduct.intensity,
                          mode: lightProduct.mode.toString(),
                          temperature: nil,
                          position: nil,
                          productType: ProductType.light.toString())
    }
 }
