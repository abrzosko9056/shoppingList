//
//  ViewController.swift
// shoppingList
//
//  Created by Alex Brzosko on 02/08/1994.
//  Copyright © 2019 John Hersey High School. All rights reserved.

import UIKit

 class ViewController: UIViewController, UITableViewDataSource {
    @IBOutlet weak var newItemTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    var items: [Item] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        
        let item1 = Item(name: "Milk", count: 2)
        let item2 = Item(name: "Eggs", count: 3)
        let item3 = Item(name: "Bread", count: 4)
        items = [item1, item2, item3]
        
    }
    
    @IBAction func buttonPressed(_ sender: UIBarButtonItem) {
        if let newitemName = newItemTextField.text {
            let newItem = Item(name: newitemName, count: 1)
            items.append(newItem)
            tableView.reloadData()
        }
        
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "myCell") {
        let itemName = items[indexPath.row].name
        cell.textLabel?.text = itemName
        let countofItem = items[indexPath.row].count
        
        cell.detailTextLabel?.text = "Quantity: \(countofItem)"
        
        return cell
        } else {
            
            return UITableViewCell()
            
        }
    
    
    
    
}

}
