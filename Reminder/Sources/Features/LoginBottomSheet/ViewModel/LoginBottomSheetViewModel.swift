//
//  LoginBottomSheetViewModel.swift
//  Reminder
//
//  Created by Willys Oliveira on 26/08/25.
//

import Foundation
import FirebaseAuth

class LoginBottomSheetViewModel {
    
    var authSuccess: (() -> Void)?
    var authenticationError: ((String) -> Void)?
    
    
    func authenticate(username: String, password: String) {
        Auth.auth().signIn(withEmail: username, password: password) {
            [weak self] authResult, error in
            
            if let error = error {
                self?.authenticationError?(error.localizedDescription)
                return
            }
            
            self?.authSuccess?()
        }
    }
}

/*
 1 -> Closures para autenticar login e senha
 
 2 -> Coordinator para gerenciar a Navigation Controller
 
 3 -> Implementar delegate para fazer comunicação entre o Coordinator e a ViewController
 
 4 -> Utilizar o Coordinator no código atual para fazer a nevegação da LoginView e SplashView
 
 */
