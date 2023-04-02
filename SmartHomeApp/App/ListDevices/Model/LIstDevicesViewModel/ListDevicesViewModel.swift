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
    let deviceName: String
    let currentState: String
    let currentStateIcon: UIImage?
    let isWorking: Bool
}
