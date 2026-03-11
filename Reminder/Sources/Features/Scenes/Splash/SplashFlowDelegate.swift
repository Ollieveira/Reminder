//
//  SplashViewControllerDelegate.swift
//  Reminder
//
//  Created by Willys Oliveira on 05/03/26.
//

import Foundation
import UIKit

protocol SplashFlowDelegate: AnyObject {
    func showLoginBottomSheet()
    func navigateToHome()
}
