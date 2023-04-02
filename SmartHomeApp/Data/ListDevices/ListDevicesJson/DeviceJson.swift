//
//  DeviceJson.swift
//  SmartHomeApp
//
//  Created by Berkan Kesman on 02/04/2023.
//

import Foundation

struct DeviceJson: Codable {
    let id: Int
    let deviceName: String
    let intensity: Int?
    let mode: String?
    let temperature: Int?
    let position: Int?
    let productType: String
}
