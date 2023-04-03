//
//  LightSteeringPresenterimplementation.swift
//  SmartHomeApp
//
//  Created by Berkan Kesman on 02/04/2023.
//

import Foundation

class LightSteeringPresenterimplementation: LightSteeringPresenter {
    
    weak var viewContract: LightSteeringViewContract?
    weak var delegate: LightSteeringPresenterDelegate?
    private let mapper = LightSteeringViewModelMapper()
    private var lightProduct: LightProduct
    
    init(viewContract: LightSteeringViewContract?,
         delegate: LightSteeringPresenterDelegate?,
         lightProduct: LightProduct) {
        self.viewContract = viewContract
        self.delegate = delegate
        self.lightProduct = lightProduct
    }
    
    //MARK: LightSteeringPresenter

    func start() {
        reload()
    }
    
    func didChangeIntensityValue(newValue: Int) {
        lightProduct.intensity = newValue
        reload()
    }
    
    func didChangePower(newValue: Bool) {
        if newValue {
            lightProduct.mode = .On
        } else {
            lightProduct.mode = .Off
        }
        reload()
    }
    
    private func reload() {
        let viewModel = mapper.map(product: lightProduct)
        viewContract?.display(with: viewModel)
    }
}
