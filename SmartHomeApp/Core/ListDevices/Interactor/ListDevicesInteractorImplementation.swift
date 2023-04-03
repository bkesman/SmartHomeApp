//
//  ListDevicesInteractorImplementation.swift
//  SmartHomeApp
//
//  Created by Berkan Kesman on 02/04/2023.
//

import Foundation

class ListDevicesInteractorImplementation: ListDevicesInteractor {
    
    private let listDevicesRepository: ListDevicesRepository
    private let listDevicesJsonMapper = ListDevicesJsonMapper()

    init(listDevicesRepository: ListDevicesRepository) {
        self.listDevicesRepository = listDevicesRepository
    }
    
    func getListDevices(completion: @escaping (Result<ListDevices, Error>)-> Void) {
        listDevicesRepository.getListDevices { result in
            switch result {
            case .success(let listDevicesJson):
                completion(.success(self.listDevicesJsonMapper.map(listDevicesJson: listDevicesJson)))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func storeDevice(device: Device,
                     completion: @escaping (Result<Void, Error>) -> Void) {
        let deviceJson = LightProductMapper().map(device: device)
        listDevicesRepository.storeDevice(deviceJsonToStore: deviceJson, completion: completion)
    }
}
