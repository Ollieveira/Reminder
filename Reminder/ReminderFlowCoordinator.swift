//
//  ReminderFlowCoordinator.swift
//  Reminder
//
//  Created by Willys Oliveira on 05/03/26.
//

import Foundation
import UIKit

class ReminderFlowCoordinator {
    // MARK: - Properties
    private var navigationController: UINavigationController?
    private let viewControllerFactory: ViewControllersFactoryProtocol

    // MARK: - Init
    public init () {
        self.viewControllerFactory = ViewControllersFactory()
    }
    
    // MARK: - startFlow
    func startFlow() -> UINavigationController? {
        let startViewController = viewControllerFactory.makeSplashViewController(flowSplashDelegate: self)
        self.navigationController = UINavigationController(rootViewController: startViewController)
        return navigationController
    }
}

// MARK: - Splash
extension ReminderFlowCoordinator: SplashFlowDelegate {
    func showLoginBottomSheet() {
        let loginBottomSheet = viewControllerFactory.makeLoginBottomSheetViewController(flowDelegate: self)
        loginBottomSheet.modalPresentationStyle = .overCurrentContext
        loginBottomSheet.modalTransitionStyle = .crossDissolve
        navigationController?.present(loginBottomSheet, animated: false) {
            loginBottomSheet.animateShow()
        }
        
        func navigateToHome() {
            self.navigationController?.dismiss(animated: false)
            let viewController = UIViewController()
            viewController.view.backgroundColor = .blue
            
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
}

// MARK: - Login
extension ReminderFlowCoordinator: LoginBottomSheetFlowDelegate {
    func navigateToHome() {
        self.navigationController?.dismiss(animated: false)
        let viewController = UIViewController()
        viewController.view.backgroundColor = .blue
        
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}

