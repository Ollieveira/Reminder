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
    public weak var flowSplashDelegate: SplashFlowDelegate?
    
    init (flowSplashDelegate: SplashFlowDelegate){
        self.flowSplashDelegate = flowSplashDelegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // Funcao do ciclo de vida das views, obrigatório para renderizar o conteudo na View
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setup()
    }
    
    // Funcao de configuracao da View, implementando a SplashView como uma Subview da Controller
    private func setup() {
        self.view.addSubview(contentView)
        self.navigationController?.isNavigationBarHidden = true
        
        setupConstraints()
        setupGesture()
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
    
    // Funcao que configura um gesture para fazer aparecer a BottomSheetView (no caso, um toque na tela)
    private func setupGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(showLoginBottomSheet))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    
    // Funcao que configura a animacao criada na LogginBottomSheetViewController para aparecer na SplashView
    // ela deve ter o @objc pois é necessário quando for chamada no #seletor
    @objc
    private func showLoginBottomSheet() {
        self.flowSplashDelegate?.showLoginBottomSheet()
    }
}
