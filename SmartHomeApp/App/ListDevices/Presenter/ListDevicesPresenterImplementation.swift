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
                self.reload(with: listDevices)
            case .failure(let error):
                print(error) //TODO: Handle error
            }
        }
    }
    
    private func reload(with listDevices: ListDevices) {
        let viewModels = mapper.map(listDevices: listDevices)
        viewContract?.display(viewModels: viewModels)
    }
}
