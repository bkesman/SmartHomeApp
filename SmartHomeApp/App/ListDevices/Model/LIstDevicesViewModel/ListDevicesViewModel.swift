//
//  ListDevicesViewModel.swift
//  SmartHomeApp
//
//  Created by Berkan Kesman on 01/04/2023.
//

import Foundation
import UIKit

struct ListDevicesViewModel {
    let devices: [DeviceViewModel]
    static let empty = ListDevicesViewModel(devices: [])
}

struct DeviceViewModel {
    let id: Int
    let deviceName: String
    let currentState: String
    let currentStateIcon: UIImage?
    let isWorking: Bool
    let productType: ProductType
}

enum ProductType {
    case light
    case rollerShutter
    case heater
    
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
