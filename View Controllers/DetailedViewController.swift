//
//  DetailedViewController.swift
//  GG
//
//  Created by Felipe De La Torre on 11/9/18.
//  Copyright © 2018 Felipe De La Torre. All rights reserved.
//

import UIKit

class DetailedViewController: UITableViewController {
    
    var game: Games?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

  
    //action for back button
    @IBAction func onBack(_ sender: Any) {
        performSegue(withIdentifier: "backSegue", sender: nil)
        
        
    }
    
}
