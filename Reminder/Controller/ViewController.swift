//
//  ViewController.swift
//  Reminder
//
//  Created by Burak Gül on 2.03.2024.
//

import UIKit

class ViewController: UIViewController {
    
    var pListOperations =  PListOperations()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .red
        pListOperations.add(Item(title: "Burak", description: "Gül", date: Date.now))
        pListOperations.add(Item(title: "Batuhan", description: "Gül", date: Date.now))
        
    }
    
    
    
    
    
}

