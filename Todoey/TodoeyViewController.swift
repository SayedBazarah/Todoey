//
//  ViewController.swift
//  Todoey
//
//  Created by Sayed Muhammad on 9/25/18.
//  Copyright © 2018 Sayed Muhammad. All rights reserved.
//

import UIKit

class TodoeyViewController: UITableViewController {

    
    // MARK -- Variables and Constants
    
    var itemArray = ["Hello" , "Hey" , "Hi"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    //MARK --  Tableview Data Source Method
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
    }
    
    //MARK -- TableView Deleget Method
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.selectionStyle = .gray
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }else{
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
    }
    
    //MARK -- Add new item button
    
    @IBAction func addButtonPressed(_ sender: Any) {
        var newItem = UITextField()
        
        let alert = UIAlertController(title: "Add New Item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add", style: .default) { (action) in
            print(action)
            self.itemArray.append(newItem.text!)
            self.tableView.reloadData()
        }
        alert.addTextField { (textFiled) in
            newItem = textFiled
        }
        alert.addAction(action)
        
        present(alert,animated: true, completion: nil)
    }
    
}

