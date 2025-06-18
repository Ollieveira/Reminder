//
//  SplashView.swift
//  Reminder
//
//  Created by Willys Oliveira on 18/06/25.
//

import Foundation
import UIKit

// Classe que é a View, onde será implementado todos os elementos (front end)
class SplashView: UIView {
    
    // Init obrigatório
    init() {
        super .init(frame: .zero)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Funcao de configuracao inicial da view
    private func setupUI() {
        self.backgroundColor = .blue
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        
    }
}
