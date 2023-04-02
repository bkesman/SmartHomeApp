//
//  Device.swift
//  SmartHomeApp
//
//  Created by Berkan Kesman on 02/04/2023.
//

import Foundation

enum Mode {
    case On
    case Off
}

enum ProductType {
    case Heater
    case RollerShutter
    case Light
}

struct Device {
    let id: Int
    let deviceName: String
    let intensity: Int?
    let mode: Mode?
    let temperature: Int?
    let position: Int?
    let productType: ProductType
}
