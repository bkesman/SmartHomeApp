//
//  DependencyProvider.swift
//  SmartHomeApp
//
//  Created by Berkan Kesman on 02/04/2023.
//

import Foundation

class DependencyProvider {
    static let shared = DependencyProvider()

    func listDevicesPresenter(viewContract: ListDevicesViewContract,
                              delegate: ListDevicesPresenterDelegate,
                              listDevicesInteractor: ListDevicesInteractor) -> ListDevicesPresenter? {
        return ListDevicesPresenterImplementation(viewContract: viewContract,
                                                  delegate: delegate,
                                                  listDevicesInteractor: listDevicesInteractor)
    }
    
    func listDevicesInteractor() -> ListDevicesInteractor {
        return ListDevicesInteractorImplementation(listDevicesRepository: listDevicesRepository())
    }
    
    func listDevicesRepository() -> ListDevicesRepository {
        return ListDevicesRepositoryImplementation()
    }
    
    func deviceSteeringPresenter(viewContract: DeviceSteeringViewContract,
                                 delegate: DeviceSteeringPresenterDelegate,
                                 device: Device,
                                 listDevicesInteractor: ListDevicesInteractor) -> DeviceSteeringPresenterImplementation? {
        return DeviceSteeringPresenterImplementation(viewContract: viewContract,
                                                     delegate: delegate,
                                                     device: device,
                                                     listDevicesInteractor: listDevicesInteractor)
    }
}

