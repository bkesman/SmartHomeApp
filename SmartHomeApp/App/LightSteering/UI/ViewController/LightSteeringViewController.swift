//
//  LightSteeringViewController.swift
//  SmartHomeApp
//
//  Created by Berkan Kesman on 02/04/2023.
//

import Foundation
import UIKit

class LightSteeringViewController: UIViewController,
                                   LightSteeringViewContract {
    
    public var presenter: LightSteeringPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.start()
        setUp()
    }
    
    private func setUp() {
    }
}

