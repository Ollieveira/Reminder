//
//  ViewControllersFactory.swift
//  Reminder
//
//  Created by Willys Oliveira on 06/03/26.
//

import Foundation
import UIKit

final class ViewControllersFactory: ViewControllersFactoryProtocol {
    func makeSplashViewController(flowSplashDelegate: SplashFlowDelegate) -> SplashViewController {
        let splashView = SplashView()
        let viewController = SplashViewController(splashView: splashView, flowSplashDelegate: flowSplashDelegate)
        return viewController
    }
    
    func makeLoginBottomSheetViewController(flowDelegate: LoginBottomSheetFlowDelegate) -> LoginBottomSheetViewController {
        let loginView = LoginBottomSheetView()
        let viewController = LoginBottomSheetViewController(loginView: loginView, flowDelegate: flowDelegate)
        return viewController
    }
}
