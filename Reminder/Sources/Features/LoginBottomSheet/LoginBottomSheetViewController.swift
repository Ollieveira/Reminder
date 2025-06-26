//
//  LoginBottomSheetViewController.swift
//  Reminder
//
//  Created by Willys Oliveira on 25/06/25.
//

import Foundation
import UIKit

class LoginBottomSheetViewController: UIViewController {
    
    let loginView = LoginBottomSheetView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        self.view.addSubview(loginView)
        loginView.translatesAutoresizingMaskIntoConstraints = false
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        
    }
}
