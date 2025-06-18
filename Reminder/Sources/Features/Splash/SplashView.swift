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
    
    //Implementacao dos componentes que aparecerão na view e suas configs iniciais (LogoImage e Titulo)
    //Geralmente se usa esse modo por instancia para uma config inicial, para que tenha uma padronização que seja
    //fácil de alterar depois, caso haja necessidade.
    let logoImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "logo")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let titleLogoLabel: UILabel = {
        let label = UILabel()
        label.text = "Remind"
        label.font = UIFont.boldSystemFont(ofSize: 32)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
        self.backgroundColor = UIColor(red: 192/255, green: 28/255, blue: 54/255, alpha: 1)
        self.addSubview(logoImageView)
        self.addSubview(titleLogoLabel)
        
        setupConstraints()
    }
    
    // Aplicamos as constraints ou limites para alinhar os componentes na view
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            self.titleLogoLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 24),
            self.titleLogoLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            self.logoImageView.bottomAnchor.constraint(equalTo: self.titleLogoLabel.bottomAnchor),
            self.logoImageView.trailingAnchor.constraint(equalTo: self.titleLogoLabel.leadingAnchor, constant: -8),
            ])
    }
}
