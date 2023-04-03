//
//  DeviceSteeringPresenterImplementation.swift
//  SmartHomeApp
//
//  Created by Berkan Kesman on 02/04/2023.
//

import Foundation

class DeviceSteeringPresenterImplementation: DeviceSteeringPresenter {
    
    weak var viewContract: DeviceSteeringViewContract?
    weak var delegate: DeviceSteeringPresenterDelegate?
    private let mapper = DeviceSteeringViewModelMapper()
    private var device: Device
    private let listDevicesInteractor: ListDevicesInteractor
    
    init(viewContract: DeviceSteeringViewContract?,
         delegate: DeviceSteeringPresenterDelegate?,
         device: Device,
         listDevicesInteractor: ListDevicesInteractor) {
        self.viewContract = viewContract
        self.delegate = delegate
        self.device = device
        self.listDevicesInteractor = listDevicesInteractor
    }
    
    //MARK: DeviceSteeringPresenter

    func start() {
        reload()
    }
    
    func didChangeIntensityValue(newValue: Int) {
        switch device.productType {
        case .light(var lightProduct):
            lightProduct.intensity = newValue
            device.productType = .light(lightProduct)
            listDevicesInteractor.storeDevice(device: device) { result in
                switch result {
                case .success:
                    self.reload()
                case .failure(let error):
                    print(error) //TODO: Handle error
                }
            }
        case .heater(var heaterProduct):
            return
        case .rollerShutter(var rollerShutterProduct):
            return
        }
        reload()
    }
    
    func didChangePower(newValue: Bool) {
        switch device.productType {
        case .light(var lightProduct):
            if newValue {
                lightProduct.mode = .On
            } else {
                lightProduct.mode = .Off
            }
            device.productType = .light(lightProduct)
            listDevicesInteractor.storeDevice(device: device) { result in
                switch result {
                case .success:
                    self.reload()
                case .failure(let error):
                    print(error) //TODO: Handle error
                }
            }
        case .heater(let heaterProduct):
            return
        case .rollerShutter(let rollerShutterProduct):
            return
        }
        reload()
    }
    
    private func reload() {
        let viewModel = mapper.map(device: device)
        viewContract?.display(with: viewModel)
    }
}
