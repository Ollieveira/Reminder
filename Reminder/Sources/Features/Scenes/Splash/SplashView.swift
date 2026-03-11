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
    
    //Implementacao dos componentes que aparecerão na view e suas configs iniciais (LogoImage)
    //Geralmente se usa esse modo por instancia para uma config inicial, para que tenha uma padronização que seja
    //fácil de alterar depois, caso haja necessidade.
    let logoImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Logo")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
        
    // Init obrigatório
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Funcao de configuracao inicial da view
    private func setupUI() {
        self.backgroundColor = Colors.primaryRedBase
        self.addSubview(logoImageView)
        
        setupConstraints()
    }
    
    // Aplicamos as constraints ou limites para alinhar os componentes na view
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            self.logoImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.logoImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            ])
    }
}
