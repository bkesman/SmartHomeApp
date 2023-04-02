//
//  ListDevicesInteractor.swift
//  SmartHomeApp
//
//  Created by Berkan Kesman on 02/04/2023.
//

import Foundation

protocol ListDevicesInteractor {
    func getListDevices(completion: @escaping (Result<ListDevices, Error>)-> Void)
}
