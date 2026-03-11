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
    let splashView: SplashView
    public weak var flowSplashDelegate: SplashFlowDelegate?
    
    init (splashView: SplashView,flowSplashDelegate: SplashFlowDelegate){
        self.splashView = splashView
        self.flowSplashDelegate = flowSplashDelegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // Funcao do ciclo de vida das views, obrigatório para renderizar o conteudo na View
    override func viewDidLoad() {
        super.viewDidLoad()
        self.startBreathingAnimation()
        
        setup()
    }
    
    private func decideNavigateFlow() {
        if let user = UserDefaultsManager.loadUser(), user.isUserSaved {
            self.flowSplashDelegate?.navigateToHome()
        } else {
            self.showLoginBottomSheet()
        }
    }
    
    // Funcao de configuracao da View, implementando a SplashView como uma Subview da Controller
    private func setup() {
        self.view.addSubview(splashView)
        self.navigationController?.isNavigationBarHidden = true
        
        setupConstraints()
        setupGesture()
    }
    
    // Funcao de configuracoes de constraints (limites) de tela da View
    private func setupConstraints() {
        setupContentViewToBounds(contentView: splashView)
    }
    
    // Funcao que configura um gesture para fazer aparecer a BottomSheetView (no caso, um toque na tela)
    private func setupGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(showLoginBottomSheet))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    
    // Funcao que configura a animacao criada na LogginBottomSheetViewController para aparecer na SplashView
    // ela deve ter o @objc pois é necessário quando for chamada no #seletor
    @objc
    private func showLoginBottomSheet() {
        self.animateLogoUp()
        self.flowSplashDelegate?.showLoginBottomSheet()
    }
}

// MARK: - Animations
extension SplashViewController {
    private func startBreathingAnimation() {
        UIView.animate(withDuration: 1.4, delay: 0.0, animations: {
            self.splashView.logoImageView.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        }, completion: { _ in
            self.decideNavigateFlow()
        })
    }
    
    private func animateLogoUp() {
        UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseOut, animations: {
            self.splashView.logoImageView.transform = self.splashView.logoImageView.transform.translatedBy(x: 0, y: -150)
        })
    }
}
