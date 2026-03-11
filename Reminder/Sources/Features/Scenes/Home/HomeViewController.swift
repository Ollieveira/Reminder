//
//  HomeViewController.swift
//  Reminder
//
//  Created by Willys Oliveira on 11/03/26.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    public weak var homeFlowDelegate: HomeFlowDelegate?
    let homeView: HomeView
    
    init(homeView: HomeView, homeFlowDelegate: HomeFlowDelegate) {
        self.homeView = homeView
        self.homeFlowDelegate = homeFlowDelegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
    }
    
    private func setupUI() {
        self.view.addSubview(homeView)
        homeView.translatesAutoresizingMaskIntoConstraints = false
        setupConstraints()
    }
    
    private func setupConstraints() {
        setupContentViewToBounds(contentView: homeView)
    }
}
