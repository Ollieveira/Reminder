//
//  LoginBottomSheetView.swift
//  Reminder
//
//  Created by Willys Oliveira on 25/06/25.
//

import Foundation
import UIKit

class LoginBottomSheetView: UIView {
    
    weak var delegate: LoginBottomSheetViewDelegate?
    
    private let handleArea: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.layer.cornerRadius = Metrics.tiny
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "login.label.title".localized
        label.font = Typografy.subHeading
        //        label.font = UIFont.preferredFont(forTextStyle: .headline)  tipo de fonte padrao do Swift (Apple) como é no SwiftUI
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let emailLabel: UILabel = {
        let label = UILabel()
        label.text = "login.email.label".localized
        label.font = Typografy.label
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "login.email.placeholder".localized
        textField.borderStyle = .roundedRect
        textField.font = Typografy.label
        textField.textColor = .black
        textField.autocapitalizationType = .none
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "login.senha.label".localized
        label.font = Typografy.label
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "login.password.placeholder".localized
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        textField.autocapitalizationType = .none
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var showPasswordButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "eye"), for: .normal)
        button.tintColor = .blue
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleShowPasswordButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("login.button.title".localized, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = Typografy.subHeading
        button.backgroundColor = Colors.primaryRedBase
        button.layer.cornerRadius = 28
        button.addTarget(self, action: #selector(loginButtonDidTaped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc
    private func handleShowPasswordButton(){
        passwordTextField.isSecureTextEntry.toggle()
        
        let imageName = passwordTextField.isSecureTextEntry ? "eye" : "eye.slash"
        showPasswordButton.setImage(UIImage(systemName: imageName), for: .normal)
    }
    
    @objc
    private func loginButtonDidTaped() {
        let user = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        delegate?.sendLogin(user: user, password: password)
    }
    
    private func setupUI() {
        self.backgroundColor = .white
        self.layer.cornerRadius = Metrics.tiny
        
        self.addSubview(handleArea)
        self.addSubview(titleLabel)
        self.addSubview(emailLabel)
        self.addSubview(emailTextField)
        self.addSubview(passwordLabel)
        self.addSubview(passwordTextField)
        self.addSubview(showPasswordButton)
        self.addSubview(loginButton)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            handleArea.topAnchor.constraint(equalTo: self.topAnchor, constant: Metrics.tiny),
            handleArea.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            handleArea.widthAnchor.constraint(equalToConstant: 40),
            handleArea.heightAnchor.constraint(equalToConstant: 6),
            
            titleLabel.topAnchor.constraint(equalTo: handleArea.bottomAnchor, constant: Metrics.medium),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.medium),
            
            emailLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Metrics.medium),
            emailLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.medium),
            
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: Metrics.tiny),
            emailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.medium),
            emailTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Metrics.medium),
            emailTextField.heightAnchor.constraint(equalToConstant: 56),
            
            
            passwordLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: Metrics.medium),
            passwordLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.medium),
            
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: Metrics.tiny),
            passwordTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.medium),
            passwordTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Metrics.medium),
            passwordTextField.heightAnchor.constraint(equalToConstant: 56),
            
            showPasswordButton.centerYAnchor.constraint(equalTo: passwordTextField.centerYAnchor),
            showPasswordButton.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor, constant: -Metrics.small),
            
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: Metrics.medium),
            loginButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.medium),
            loginButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Metrics.medium),
            loginButton.heightAnchor.constraint(equalToConstant: 56),
        ])
    }
}

//#Preview {
//    LoginBottomSheetView()
//}
