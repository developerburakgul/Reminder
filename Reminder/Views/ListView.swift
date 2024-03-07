//
//  CreatingItemScreen.swift
//  Reminder
//
//  Created by Burak Gül on 7.03.2024.
//

import UIKit

class ListView: UIView {
    
    var tableView = UITableView()
    var pListOperations = PListOperations()
    var dataSource : [Item] = [Item]()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configuration()
        pListOperations.add(Item(title: "Burak", description: "Gül", date: Date.now))
        pListOperations.add(Item(title: "Burak", description: "Gül2", date: Date.now))
        pListOperations.add(Item(title: "Burak", description: "Gül3", date: Date.now))
        dataSource = pListOperations.getItems()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Configure Functions
    
    private func configuration() {
        configurationTableView()
    }
    
    private func configurationTableView()  {
        tableView.dataSource = self
        tableView.delegate = self
        addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            tableView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0)
        ])
        
    }
}

extension ListView : UITableViewDelegate ,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var configuration = cell.defaultContentConfiguration()
        configuration.text = " \(dataSource[indexPath.row].title)" + "\n \(dataSource[indexPath.row].description) \n \(dataSource[indexPath.row].date!.formatted(date: .abbreviated, time: .shortened))"
        cell.contentConfiguration = configuration
        return cell
        
    }
    
    
}

#Preview(""){
    UINavigationController(rootViewController: ListViewController())

}
