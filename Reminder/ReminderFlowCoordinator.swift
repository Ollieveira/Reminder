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

    // MARK: - Init
    public init () {
        
    }
    
    // MARK: - startFlow
    func startFlow() -> UINavigationController? {
        let startViewController = SplashViewController(flowSplashDelegate: self)
        self.navigationController = UINavigationController(rootViewController: startViewController)
        return navigationController
    }
}

// MARK: - Splash
extension ReminderFlowCoordinator: SplashFlowDelegate {
    func showLoginBottomSheet() {
        let loginBottomSheet = LoginBottomSheetViewController(flowDelegate: self)
        loginBottomSheet.modalPresentationStyle = .overCurrentContext
        loginBottomSheet.modalTransitionStyle = .crossDissolve
        navigationController?.present(loginBottomSheet, animated: false) {
            loginBottomSheet.animateShow()
        }
    }
}

// MARK: - Login
extension ReminderFlowCoordinator: LoginBottomSheetFlowDelegate {
    func navigateToHome() {
        let viewController = UIViewController()
        viewController.view.backgroundColor = .blue
        
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}

