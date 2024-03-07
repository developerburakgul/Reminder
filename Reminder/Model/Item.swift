//
//  Item.swift
//  Reminder
//
//  Created by Burak Gül on 4.03.2024.
//

import Foundation

class Item : Codable {
    var title : String
    var description : String
    var date : Date?
    
    init(title: String, description: String, date: Date? = nil) {
        self.title = title
        self.description = description
        self.date = date
    }

}
