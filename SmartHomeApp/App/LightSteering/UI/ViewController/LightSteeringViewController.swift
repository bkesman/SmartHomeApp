//
//  LightSteeringViewController.swift
//  SmartHomeApp
//
//  Created by Berkan Kesman on 02/04/2023.
//

import Foundation
import UIKit

class LightSteeringViewController: UIViewController,
                                   LightSteeringViewContract,
                                   LightSteeringViewDelegate {
    
    public var presenter: LightSteeringPresenter?
    private let lightSteeringView = LightSteeringView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.start()
        setUp()
    }
    
    //MARK: LightSteeringViewContract
    
    func display(with viewModel: LightSteeringViewModel) {
        lightSteeringView.configure(with: viewModel)
    }
    
    //MARK: LightSteeringViewDelegate
    
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

