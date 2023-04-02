//
//  ListDevicesRepositoryImplementation.swift
//  SmartHomeApp
//
//  Created by Berkan Kesman on 02/04/2023.
//

import Foundation

class ListDevicesRepositoryImplementation: ListDevicesRepository {
    
    func getListDevices(completion: @escaping (Result<ListDevicesJson, Error>)-> Void) {
        
            readLocalFile(forName: "ListDevicesJson") { result in
                switch result {
                case .success(let data):
                    self.parse(data: data) { result in
                        switch result {
                        case .success(let listDevicesJson):
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

}
