//
//  SplashViewController.swift
//  Reminder
//
//  Created by Willys Oliveira on 18/06/25.
//

import Foundation
import UIKit

//Classe que controla a SplashView
class SplashViewController: UIViewController {
    
    // Instanciando a SplashView na SplashController, "dizendo" a classe que ela é responsavel por gerenciar esta View
    let contentView = SplashView()
    
    // Funcao do ciclo de vida das views, obrigatório para renderizar o conteudo na View
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    // Funcao de configuracao da View, implementando a SplashView como uma Subview da Controller
    private func setup() {
        self.view.addSubview(contentView)
        
        setupConstraints()
    }
    
    // Funcao de configuracoes de constraints (limites) de tela da View
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: self.view.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            contentView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            contentView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
        ])
        
        // Linha de código obrigatória toda vez que que adicionamos um elemento em UIKit sem Storyboard
        contentView.translatesAutoresizingMaskIntoConstraints = false
    }
}
