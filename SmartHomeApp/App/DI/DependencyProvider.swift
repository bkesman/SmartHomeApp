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
                                delegate: ListDevicesPresenterDelegate) -> ListDevicesPresenter? {
        return ListDevicesPresenterImplementation(viewContract: viewContract,
                                                  delegate: delegate)
    }
}

