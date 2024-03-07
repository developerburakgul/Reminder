//
//  ListViewController.swift
//  Reminder
//
//  Created by Burak Gül on 7.03.2024.
//

import UIKit

class ListViewController: UIViewController {
    
    private lazy var listView = ListView()
    
    override func loadView() {
        self.view = listView
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
    }
    
    //MARK: - Prepare Navigation Bar
    
    private func setupNavigationBar() {
        navigationItem.title = "Reminder"
        
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.white
        appearance.titleTextAttributes = [.foregroundColor: UIColor.systemBlue] // Opsiyonel: Başlık rengini değiştir
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.systemBlue] // Opsiyonel: Büyük başlık rengini değiştir
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "ellipsis.circle"),
            style: .done,
            target: self,
            action: #selector(pressedSettingButton)
        )
        
        // Bar button item'ların rengi
        navigationController?.navigationBar.tintColor = .systemBlue
        
        // Bu navigation bar appearance'ı uygula
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    @objc private func pressedSettingButton() {
        print(#function)
    }
}

#Preview(""){
    UINavigationController(rootViewController: ListViewController())

}
