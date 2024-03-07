//
//  PListOperations.swift
//  Reminder
//
//  Created by Burak Gül on 7.03.2024.
//

import Foundation

struct PListOperations {
    private var itemArray : [Item] = [] {
        didSet{
            sortArray()
        }
    }
    private var sortedArray = [Item]()
    
    //MARK: - Private Functions
    private func saveItemArray()  {
        let encoder = PropertyListEncoder()
        guard let dataFilePath = Constants.dataFilePath else {
            fatalError("data file path is nil")
        }
        do {
            let data = try encoder.encode(self.itemArray)
            try data.write(to: dataFilePath)
        } catch  {
            print("error Encoding array ")
        }
    }
    
    func sortArray()  {
        print("Sort array çalıştı")
    }
    
    
    
    private mutating func loadItem(){
        guard let dataFilePath = Constants.dataFilePath else {
            fatalError("data file path is nil")
        }
        if let data = try? Data(contentsOf: dataFilePath) {
            let decoder = PropertyListDecoder()
            
            do {
                itemArray = try decoder.decode([Item].self, from: data)
            } catch  {
                print("Error decoding item array , \(error)")
            }
        }
    }
    
    private func printItemArray() {
        var dateString = ""
        for item in itemArray {
            dateString = item.date?.formatted(
                Date.FormatStyle()
                    .day(.twoDigits)
                    .month(.twoDigits)
                    .year(.defaultDigits)
                    .hour(.twoDigits(amPM: .wide))
                    .minute(.defaultDigits)
            
            ) ?? "nil"
            print("\(item.title) \(item.description) and date is : \(dateString)")
        }
    }
    
    //MARK: - Public Functions
    mutating func add(_ item : Item){
        itemArray.append(item)
        saveItemArray()
    }
    func getItems() -> [Item] {
        return itemArray
    }
    
    
}

