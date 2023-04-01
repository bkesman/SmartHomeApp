//
//  RootCoordinator.swift
//  SmartHomeApp
//
//  Created by Berkan Kesman on 01/04/2023.
//

import Foundation
import UIKit

class RootCoordinator {
    
    let rootViewController: UIViewController
    private lazy var listDevicesCoordinator = createListDevicesCoordinator()
    
    init(rootViewController: UIViewController){
        self.rootViewController = rootViewController
    }
    
    func start() {
        listDevicesCoordinator.start()
    }
    
    private func createListDevicesCoordinator() -> ListDevicesCoordinator {
        return ListDevicesCoordinator(
          rootViewController: rootViewController)
    }
}
