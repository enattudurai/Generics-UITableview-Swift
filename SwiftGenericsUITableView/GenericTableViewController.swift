//
//  GenericTableViewController.swift
//  SwiftGenericsUITableView
//
//  Created by Naattudurai Eswaramurthy on 18/02/19.
//  Copyright © 2019 Naattudurai Eswaramurthy. All rights reserved.
//

import UIKit

class GenericTableViewController<T :BaseCell<U>, U >: UITableViewController {

    let cellId = "cellId"

    var items = [U]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        tableView.register(T.self, forCellReuseIdentifier: cellId)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! BaseCell<U>
         //Configure the cell...
        cell.item = items[indexPath.row]

        return cell
    }

}

class BaseCell<U> : UITableViewCell
{
    var item: U!
    
}
