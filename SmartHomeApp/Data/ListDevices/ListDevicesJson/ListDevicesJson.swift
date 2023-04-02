//
//  ListDevicesJson.swift
//  SmartHomeApp
//
//  Created by Berkan Kesman on 02/04/2023.
//

import Foundation

struct ListDevicesJson: Codable {
    let devices: [DeviceJson]
}
