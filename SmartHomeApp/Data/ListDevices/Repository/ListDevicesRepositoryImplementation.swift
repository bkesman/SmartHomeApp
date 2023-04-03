//
//  ListDevicesRepositoryImplementation.swift
//  SmartHomeApp
//
//  Created by Berkan Kesman on 02/04/2023.
//

import Foundation

class ListDevicesRepositoryImplementation: ListDevicesRepository {
    
    private let userDefaults = UserDefaults()

    func getListDevices(completion: @escaping (Result<ListDevicesJson, Error>)-> Void) {
            if let data = userDefaults.object(forKey: "ListDevices") as? Data,
               let listDevicesJson = try? JSONDecoder().decode(ListDevicesJson.self, from: data) {
                completion(.success(listDevicesJson))
            } else {
                readLocalFile(forName: "ListDevicesJson") { result in
                    switch result {
                    case .success(let data):
                        self.parse(data: data) { result in
                            switch result {
                            case .success(let listDevicesJson):
                                do {
                                    try self.storeJsonDataToDisk(listDevicesJson: listDevicesJson)
                                } catch {
                                    completion(.failure(error))
                                    return
                                }
                                completion(.success(listDevicesJson))
                            case .failure(let error):
                                completion(.failure(error))
                            }
                        }
                    case .failure(let error):
                        completion(.failure(error))
                    }
                }
            }
    }
    
    func storeDevice(deviceJsonToStore: DeviceJson, completion: @escaping (Result<Void, Error>) -> Void) {
        do {
            let data = userDefaults.object(forKey: "ListDevices") as! Data
            var listDevicesJson = try JSONDecoder().decode(ListDevicesJson.self, from: data)
            for (indexDeviceJson,deviceJson) in listDevicesJson.devices.enumerated() {
                if deviceJsonToStore.id == deviceJson.id {
                    listDevicesJson.devices[indexDeviceJson] = deviceJsonToStore
                        do {
                            try self.storeJsonDataToDisk(listDevicesJson: listDevicesJson)
                        } catch {
                            completion(.failure(error))
                            return
                        }
                        completion(.success(Void()))
                        return
                }
            }
        } catch {
            completion(.failure(error))
        }
    }
    
    private func readLocalFile(forName name: String, completion: @escaping (Result<Data, Error>) -> Void) {
        do {
            if let bundlePath = Bundle.main.path(forResource: name,
                                                 ofType: "json"),
                let data = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                completion(.success(data))
            }
        } catch {
            completion(.failure(error))
        }
    }
    
    private func parse(data: Data,
                       completion: @escaping (Result<ListDevicesJson, Error>) -> Void) {
        do {
            let jsonData = try JSONDecoder().decode(ListDevicesJson.self,
                                                       from: data)
            
            completion(.success(jsonData))
        } catch {
            completion(.failure(error))
        }
    }
    
    private func storeJsonDataToDisk(listDevicesJson: ListDevicesJson) throws {
        let encodedListDevicesJson = try JSONEncoder().encode(listDevicesJson)
        self.userDefaults.set(encodedListDevicesJson, forKey: "ListDevices")
    }
}
