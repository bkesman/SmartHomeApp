//
//  ListDevicesPresenter.swift
//  SmartHomeApp
//
//  Created by Berkan Kesman on 01/04/2023.
//

import Foundation

protocol ListDevicesPresenter {
    func start()
    func didSelectDevice(with id: Int, productType: ProductType)
}

protocol ListDevicesPresenterDelegate: AnyObject {
    func didSelectRollerShutterProduct(_ product: RollerShutterProduct)
    func didSelectHeaterProduct(_ product: HeaterProduct)
    func didSelectLightProduct(_ product: LightProduct)
}
