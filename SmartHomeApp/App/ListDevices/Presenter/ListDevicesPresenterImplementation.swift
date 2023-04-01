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
    private let mapper = ListDevicesViewModelMapper()
 
    init(viewContract: ListDevicesViewContract?,
         delegate: ListDevicesPresenterDelegate?) {
        self.viewContract = viewContract
        self.delegate = delegate
    }
    
    //MARK: ListDevicesPresenter

    func start() {
    }
}
