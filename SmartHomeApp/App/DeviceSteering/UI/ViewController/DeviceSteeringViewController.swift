//
//  DeviceSteeringViewController.swift
//  SmartHomeApp
//
//  Created by Berkan Kesman on 02/04/2023.
//

import Foundation
import UIKit

class DeviceSteeringViewController: UIViewController,
                                    DeviceSteeringViewContract,
                                    LightSteeringViewDelegate {
    
    public var presenter: DeviceSteeringPresenter?
    private let lightSteeringView = LightSteeringView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.start()
        setUp()
    }
    
    //MARK: DeviceSteeringViewContract
    
    func display(with viewModel: DeviceSteeringViewModel) {
        switch viewModel {
        case .lightSteeringViewModel(let lightSteeringViewModel):
            lightSteeringView.isHidden = false
            lightSteeringView.configure(with: lightSteeringViewModel)
        case .rollerShutterSteeringViewModel(let rollerShutterSteeringViewModel):
            lightSteeringView.isHidden = true
            return
        case .heaterSteeringViewModel(let heaterSteeringViewModel):
            lightSteeringView.isHidden = true
            return
        }
    }
    
    //MARK: DeviceSteeringViewDelegate
    
    func lightSteeringViewDelegate(didChangeIntensityValueForView: LightSteeringView,
                                   newValue: Int) {
        presenter?.didChangeIntensityValue(newValue: newValue)
    }
    
    func lightSteeringViewDelegate(didChangePowerSwitchForView: LightSteeringView,
                                   newValue: Bool) {
        presenter?.didChangePower(newValue: newValue)
    }

    private func setUp() {
        lightSteeringView.delegate = self
        view.addSubview(lightSteeringView)
        lightSteeringView.translatesAutoresizingMaskIntoConstraints = false
        lightSteeringView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        lightSteeringView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        lightSteeringView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        lightSteeringView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
}

