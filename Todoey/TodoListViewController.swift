//
//  ViewController.swift
//  Todoey
//
//  Created by Banana on 13/9/19.
//  Copyright © 2019 BananaWorks. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    let itemArray = ["Find Mike", "Buy Eggos", "Destroy Demogorgon"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    //MARK -- Tableview Datasource Methods
    
    //TODO: Declare cellForRowAtIndexPath here:
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell
        
    }

    //TODO: Declare numberOfRowsInSection here:
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return itemArray.count
    }
    
    //MARK -- TableView Delegate Methods
    
    

}

