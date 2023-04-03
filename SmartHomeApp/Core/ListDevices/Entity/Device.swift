//
//  Device.swift
//  SmartHomeApp
//
//  Created by Berkan Kesman on 02/04/2023.
//

import Foundation

struct Device {
    let id: Int
    let deviceName: String
    var productType: ProductType
}

enum ProductType {
    case heater(HeaterProduct)
    case rollerShutter(RollerShutterProduct)
    case light(LightProduct)
    
    func toString() -> String {
        switch self {
        case .light:
            return "Light"
        case .heater:
            return "Heater"
        case .rollerShutter:
            return "RollerShutter"
        }
    }
}

