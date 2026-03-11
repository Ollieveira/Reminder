//
//  ViewControllersFactoryProtocol.swift
//  Reminder
//
//  Created by Willys Oliveira on 06/03/26.
//

import Foundation

protocol ViewControllersFactoryProtocol: AnyObject {
    func makeSplashViewController(flowSplashDelegate: SplashFlowDelegate) -> SplashViewController
    func makeLoginBottomSheetViewController(flowDelegate: LoginBottomSheetFlowDelegate) -> LoginBottomSheetViewController
    func makeHomeViewController(flowHomeDelegate: HomeFlowDelegate) -> HomeViewController
}
