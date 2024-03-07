//
//  Constants.swift
//  Reminder
//
//  Created by Burak Gül on 7.03.2024.
//

import Foundation


enum Constants {
    static let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Items.plist")
}
