//
//  HomeView.swift
//  Reminder
//
//  Created by Willys Oliveira on 11/03/26.
//

import Foundation
import UIKit

class HomeView: UIView {
    let header: UIView = {
        let headerView = UIView()
        headerView.backgroundColor = Colors.gray600
        headerView.translatesAutoresizingMaskIntoConstraints = false
        return headerView
    }()
    
    let avatar: UIImageView = {
        let avatarImageView = UIImageView()
        avatarImageView.image = UIImage(named: "Foto-Profissional")
        avatarImageView.contentMode = .scaleAspectFill
        avatarImageView.clipsToBounds = true
        avatarImageView.layer.cornerRadius = Metrics.big
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        return avatarImageView
    }()
    
    let welcomeLabel: UILabel = {
        let welcomeLabel = UILabel()
        welcomeLabel.text = "home.label.welcome".localized
        welcomeLabel.font = Typografy.input
        welcomeLabel.textColor = Colors.gray200
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        return welcomeLabel
    }()
    
    let usernameLabel: UILabel = {
        let usernameLabel = UILabel()
        usernameLabel.text = "home.label.username".localized
        usernameLabel.font = Typografy.heading
        usernameLabel.textColor = Colors.gray100
        usernameLabel.translatesAutoresizingMaskIntoConstraints = false
        return usernameLabel
    }()
    
    let logoutButton: UIButton = {
        let logoutButton = UIButton(type: .system)
        logoutButton.setImage(UIImage(systemName: "rectangle.portrait.and.arrow.forward"), for: .normal)
        logoutButton.tintColor = Colors.primaryRedBase
        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        return logoutButton
    }()
    
    let content: UIView = {
        let contentView = UIView()
        contentView.backgroundColor = Colors.gray800
        contentView.layer.cornerRadius = Metrics.medium
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()
    
    let rateButton: UIButton = {
        let rateButton = UIButton(type: .system)
        rateButton.setImage(UIImage(systemName: "star"), for: .normal)
        rateButton.tintColor = Colors.gray800
        rateButton.setTitle("home.button.rate".localized, for: .normal)
        rateButton.titleLabel?.font = Typografy.subHeading
        rateButton.setTitleColor(Colors.gray800, for: .normal)
        rateButton.backgroundColor = Colors.gray100
        rateButton.layer.cornerRadius = Metrics.big
        rateButton.translatesAutoresizingMaskIntoConstraints = false
        return rateButton
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        self.addSubview(header)
        self.header.addSubview(avatar)
        self.header.addSubview(welcomeLabel)
        self.header.addSubview(usernameLabel)
        self.header.addSubview(logoutButton)
        self.addSubview(content)
        self.content.addSubview(rateButton)
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            self.header.topAnchor.constraint(equalTo: self.topAnchor),
            self.header.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.header.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.header.heightAnchor.constraint(equalToConstant: 278),
            
            self.avatar.heightAnchor.constraint(equalToConstant: 64),
            self.avatar.widthAnchor.constraint(equalToConstant: 64),
            self.avatar.topAnchor.constraint(equalTo: self.header.topAnchor, constant: 80),
            self.avatar.leadingAnchor.constraint(equalTo: self.header.leadingAnchor, constant: 32),
            
            self.welcomeLabel.bottomAnchor.constraint(equalTo: self.avatar.bottomAnchor, constant: 32),
            self.welcomeLabel.leadingAnchor.constraint(equalTo: self.header.leadingAnchor, constant: 32),
            
            self.usernameLabel.bottomAnchor.constraint(equalTo: self.welcomeLabel.bottomAnchor, constant: 24),
            self.usernameLabel.leadingAnchor.constraint(equalTo: self.header.leadingAnchor, constant: 32),
            
            self.logoutButton.topAnchor.constraint(equalTo: self.header.topAnchor, constant: 80),
            self.logoutButton.trailingAnchor.constraint(equalTo: self.header.trailingAnchor, constant: -32),

            self.content.topAnchor.constraint(equalTo: self.header.bottomAnchor, constant: -40),
            self.content.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.content.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.content.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            self.rateButton.widthAnchor.constraint(equalToConstant: 326),
            self.rateButton.heightAnchor.constraint(equalToConstant: 56),
            self.rateButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.rateButton.bottomAnchor.constraint(equalTo: self.content.bottomAnchor, constant: -48),
        ])
    }
}

#Preview {
    HomeView()
}
