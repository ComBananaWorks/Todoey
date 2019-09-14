//
//  ViewController.swift
//  Todoey
//
//  Created by Banana on 13/9/19.
//  Copyright © 2019 BananaWorks. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    var itemArray = [Item]()
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        if let items = defaults.array(forKey: "TodoListArray") as? [String]{
//            itemArray = items
//        }

        var newItem = Item()
        newItem.title = "Find Mike"
        itemArray.append(newItem)

        newItem = Item()
        newItem.title = "Buy Eggos"
        itemArray.append(newItem)

        newItem = Item()
        newItem.title = "Destroy Demo"
        itemArray.append(newItem)

    }

    //MARK -- Tableview Datasource Methods
    
    //TODO: Declare cellForRowAtIndexPath here:
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        let item = itemArray[indexPath.row]
        
        cell.textLabel?.text = item.title
        
        cell.accessoryType = item.done ? .checkmark : .none // same as below
        
//        if item.done {
//            cell.accessoryType = .checkmark
//        }else{
//            cell.accessoryType = .none
//
//        }

        return cell
        
    }

    //TODO: Declare numberOfRowsInSection here:
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return itemArray.count
    }
    
    //MARK -- TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done

//        if tableView.cellForRow(at: indexPath)?.accessoryType != .checkmark {
//            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
//        }else{
//            tableView.cellForRow(at: indexPath)?.accessoryType = .none
//
//        }
        tableView.reloadData() // forces table view to call resource methods again
        tableView.deselectRow(at: indexPath, animated: true)
    }

    
    //MARK ADD NEW ITEMS
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default){
            (action) in // closure when UIAlertAction is done
            
//            self.itemArray.append (textField.text ?? "Default New Item")

            let newItem = Item()
            newItem.title = textField.text!
            self.itemArray.append (newItem)
            
            self.defaults.set(self.itemArray, forKey: "TodoListArray")
            
            self.tableView.reloadData()
            
        }
        
        alert.addTextField { (alertTextField) in // closure when creating textfield
            alertTextField.placeholder = "Create New Item"
            textField = alertTextField
        }
        
        alert.addAction(action)
        
        present (alert, animated: true, completion: nil)
    }
    
}

