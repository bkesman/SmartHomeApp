//
//  ListDevices.swift
//  SmartHomeApp
//
//  Created by Berkan Kesman on 02/04/2023.
//

import Foundation

enum Mode {
    case On
    case Off
}

struct ListDevices {
    var heaters: [HeaterProduct]
    var rollerShutters: [RollerShutterProduct]
    var lights: [LightProduct]
}
