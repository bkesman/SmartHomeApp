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
    }
}
