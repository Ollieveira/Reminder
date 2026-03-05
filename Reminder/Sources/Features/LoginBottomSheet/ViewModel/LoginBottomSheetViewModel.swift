//
//  LoginBottomSheetViewModel.swift
//  Reminder
//
//  Created by Willys Oliveira on 26/08/25.
//

import Foundation
import FirebaseAuth

class LoginBottomSheetViewModel {
    func authenticate(username: String, password: String) {
        Auth.auth().signIn(withEmail: username, password: password) { [ weak self ] authResult, error in
            if let error = error {
                print ("Error signing in: \(error)")
            } else {
                print("Successfully signed in!")
            }
        }
    }
}
