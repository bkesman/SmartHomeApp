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
                                    LightSteeringViewDelegate,
                                    RollerShutterSteeringViewDelegate {
    
    public var presenter: DeviceSteeringPresenter?
    private let lightSteeringView = LightSteeringView()
    private let rollerShutterSteeringView = RollerShutterSteeringView()

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
            rollerShutterSteeringView.isHidden = true
            lightSteeringView.configure(with: lightSteeringViewModel)
        case .rollerShutterSteeringViewModel(let rollerShutterSteeringViewModel):
            lightSteeringView.isHidden = true
            rollerShutterSteeringView.isHidden = false
            rollerShutterSteeringView.configure(with: rollerShutterSteeringViewModel)
            return
        case .heaterSteeringViewModel(_):
            lightSteeringView.isHidden = true
            rollerShutterSteeringView.isHidden = true
            return
        }
    }
    
    //MARK: DeviceSteeringViewDelegate
    
    func lightSteeringViewDelegate(didChangeIntensityValueForView: LightSteeringView,
                                   newValue: Int) {
        presenter?.didChangeIntensityValue(newValue: newValue)
    }
    
    func lightSteeringViewDelegate(didRequestNewIntensityValueForView: LightSteeringView,
                                   newValue: Int) {
        presenter?.didRequestNewIntensityValue(newValue: newValue)
    }

    
    func lightSteeringViewDelegate(didChangePowerSwitchForView: LightSteeringView,
                                   newValue: Bool) {
        presenter?.didChangePower(newValue: newValue)
    }
    
    //MARK: RollerShutterSteeringViewDelegate

    func rollerShutterSteeringViewDelegate(didChangePositionValueForView: RollerShutterSteeringView,
                                           newValue: Int) {
        presenter?.didChangePositionValue(newValue: newValue)
    }
    
    func rollerShutterSteeringViewDelegate(didRequestNewPositionValueForView: RollerShutterSteeringView,
                                           newValue: Int) {
        presenter?.didRequestNewPositionValue(newValue: newValue)
    }


    private func setUp() {
        lightSteeringView.delegate = self
        rollerShutterSteeringView.delegate = self
        view.addSubview(lightSteeringView)
        view.addSubview(rollerShutterSteeringView)
        lightSteeringView.translatesAutoresizingMaskIntoConstraints = false
        rollerShutterSteeringView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            lightSteeringView.topAnchor.constraint(equalTo: view.topAnchor),
            lightSteeringView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            lightSteeringView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            lightSteeringView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            rollerShutterSteeringView.topAnchor.constraint(equalTo: view.topAnchor),
            rollerShutterSteeringView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            rollerShutterSteeringView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            rollerShutterSteeringView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

