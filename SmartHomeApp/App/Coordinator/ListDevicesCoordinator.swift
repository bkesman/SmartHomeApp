//
//  ListDevicesCoordinator.swift
//  SmartHomeApp
//
//  Created by Berkan Kesman on 01/04/2023.
//

import Foundation
import UIKit

class ListDevicesCoordinator: ListDevicesPresenterDelegate {
    
    let rootViewController: UIViewController
    let navigationController = UINavigationController()

    init(rootViewController: UIViewController){
        self.rootViewController = rootViewController
    }
    
    //MARK: ListDevicesPresenterDelegate
    
    func didSelectRollerShutterProduct(_ product: RollerShutterProduct) {
        
    }
    
    func didSelectHeaterProduct(_ product: HeaterProduct) {
        
    }
    
    func didSelectLightProduct(_ product: LightProduct) {
        
    }
    
    func start() {
        let viewController = ListDevicesViewController()
        viewController.presenter = DependencyProvider.shared.listDevicesPresenter(viewContract: viewController,
                                                                                  delegate: self,
                                                                                  listDevicesInteractor: DependencyProvider.shared.listDevicesInteractor())
        rootViewController.addChild(navigationController)
        rootViewController.view.addSubview(navigationController.view)
        navigationController.didMove(toParent: rootViewController)
        navigationController.view.translatesAutoresizingMaskIntoConstraints = false
        navigationController.view.bottomAnchor.constraint(equalTo: rootViewController.view.bottomAnchor).isActive = true
        navigationController.view.widthAnchor.constraint(equalTo: rootViewController.view.widthAnchor).isActive = true
        navigationController.view.heightAnchor.constraint(equalTo: rootViewController.view.heightAnchor).isActive = true
        navigationController.pushViewController(viewController, animated: false)
    }
}
