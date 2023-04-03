//
//  ListDevicesRepository.swift
//  SmartHomeApp
//
//  Created by Berkan Kesman on 02/04/2023.
//

import Foundation

protocol ListDevicesRepository {
    func getListDevices(completion: @escaping (Result<ListDevicesJson, Error>)-> Void)
    func storeDevice(deviceJsonToStore: DeviceJson, completion: @escaping (Result<Void, Error>) -> Void)
}
