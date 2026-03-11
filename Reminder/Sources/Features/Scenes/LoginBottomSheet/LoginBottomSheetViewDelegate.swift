//
//  LoginBottomSheetViewDelegate.swift
//  Reminder
//
//  Created by Willys Oliveira on 25/08/25.
//

import Foundation

protocol LoginBottomSheetViewDelegate: AnyObject {
    func sendLogin(user: String, password: String)
}
