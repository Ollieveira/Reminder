//
//  LoginBottomSheetViewController.swift
//  Reminder
//
//  Created by Willys Oliveira on 25/06/25.
//

import Foundation
import UIKit

class LoginBottomSheetViewController: UIViewController {
    
    public weak var flowDelegate: LoginBottomSheetFlowDelegate?
    let loginView: LoginBottomSheetView
    let viewmodel = LoginBottomSheetViewModel()
    var handleAreaHeight: CGFloat = 50.0
    
    
    init (loginView: LoginBottomSheetView, flowDelegate: LoginBottomSheetFlowDelegate){
        self.loginView = loginView
        self.flowDelegate = flowDelegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginView.delegate = self
        setupUI()
        setupGesture()
        bindViewModel()
    }
    
    private func setupUI() {
        self.view.addSubview(loginView)
        loginView.translatesAutoresizingMaskIntoConstraints = false
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            loginView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            loginView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            loginView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
        ])
        
        let heightConstraint = loginView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.5)
        heightConstraint.isActive = true
        
    }
    
    private func bindViewModel() {
        viewmodel.authSuccess = { [weak self] email in
            DispatchQueue.main.async {
                self?.presentSaveLoginAlert(email: email)
            }
        }
        
        viewmodel.authenticationError = { [weak self] message in
            DispatchQueue.main.async {
                self?.presentErrorAlert(message: message)
            }
        }
    }
    
    private func presentSaveLoginAlert(email: String) {
        let alertController = UIAlertController(title: "Salvar Acesso", message: "Deseja salvar o seu acesso?", preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "Salvar", style: .default) { _ in
            let user = User(email: email, isUserSaved: true)
            UserDefaultsManager.saveUser(user: user)
            self.flowDelegate?.navigateToHome()
        }
        
        let cancelAction = UIAlertAction(title: "Não", style: .cancel) { _ in
            self.flowDelegate?.navigateToHome()
        }
        
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    private func presentErrorAlert(message: String) {
        let alertController = UIAlertController(title: "Erro ao Logar", message: "Erro ao realizar login: '\(message)' Verifique as credencias e tente novamente.", preferredStyle: .alert)
        
        let retryAction = UIAlertAction(title: "Tentar novamente", style: .default)
        
        alertController.addAction(retryAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    private func setupGesture() {
        
    }
    
    private func handlePanGesture() {
        
    }
    
    func animateShow(completion: (() -> Void)? = nil) {
        self.view.layoutIfNeeded()
        loginView.transform = CGAffineTransform(translationX: 0, y: loginView.frame.height)
        UIView.animate(withDuration: 0.3, animations: {
            self.loginView.transform = .identity
            self.view.layoutIfNeeded()
        }) { _ in
            completion?()
        }
    }
}

extension LoginBottomSheetViewController: LoginBottomSheetViewDelegate {
    func sendLogin(user: String, password: String) {
        viewmodel.authenticate(username: user, password: password)
    }
}

//#Preview {
//    LoginBottomSheetViewController()
//}
