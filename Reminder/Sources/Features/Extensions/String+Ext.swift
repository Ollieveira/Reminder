//
//  String+Ext.swift
//  Reminder
//
//  Created by Willys Oliveira on 28/06/25.
//

import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
