//
//  UserDeafultsManager.swift
//  Reminder
//
//  Created by Willys Oliveira on 10/03/26.
//

import Foundation
import UIKit

class UserDefaultsManager {
    static var userKey: String = "userKey"
    
    static func saveUser(user: User) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(user) {
            UserDefaults.standard.set(encoded, forKey: userKey)
        }
    }
    
    static func loadUser() -> User? {
        if let userData = UserDefaults.standard.data(forKey: userKey) {
            let decoder = JSONDecoder()
            if let user = try? decoder.decode(User.self, from: userData) {
                return user
            }
        }
        return nil
    }
}
