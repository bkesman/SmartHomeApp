//
//  ListDevicesPresenterImplementation.swift
//  SmartHomeApp
//
//  Created by Berkan Kesman on 01/04/2023.
//

import Foundation

class ListDevicesPresenterImplementation: ListDevicesPresenter {
    
    weak var viewContract: ListDevicesViewContract?
    weak var delegate: ListDevicesPresenterDelegate?
    private let listDevicesInteractor: ListDevicesInteractor
    private let mapper = ListDevicesViewModelMapper()
    private var listDevices: ListDevices?
    
    init(viewContract: ListDevicesViewContract?,
         delegate: ListDevicesPresenterDelegate?,
         listDevicesInteractor: ListDevicesInteractor) {
        self.viewContract = viewContract
        self.delegate = delegate
        self.listDevicesInteractor = listDevicesInteractor
    }
    
    //MARK: ListDevicesPresenter

    func start() {
        listDevicesInteractor.getListDevices { result in
            switch result {
            case .success(let listDevices):
                self.listDevices = listDevices
                self.reload(with: listDevices)
            case .failure(let error):
                print(error) //TODO: Handle error
            }
        }
    }
    
    func didSelectDevice(with id: Int) {
        guard let device = listDevices?.devices.first(where: { device in
            device.id == id
        }) else {
            return
        }
        delegate?.didSelect(device: device)
    }
    
    private func reload(with listDevices: ListDevices) {
        let viewModels = mapper.map(listDevices: listDevices)
        viewContract?.display(viewModels: viewModels)
    }
}
