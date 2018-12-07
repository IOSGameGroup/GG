//
//  HomeViewController.swift
//  GG
//
//  Created by Felipe De La Torre on 11/9/18.
//  Copyright © 2018 Felipe De La Torre. All rights reserved.
//

import UIKit
import AlamofireImage

class HomeViewController: UIViewController, UITableViewDataSource {
    

    @IBOutlet weak var tableView: UITableView!
    var refreshControl: UIRefreshControl!
    var games: [Games] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // needed for pull to refresh
        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(HomeViewController.didPullToRefresh(_:)), for: .valueChanged)
        tableView.insertSubview(refreshControl, at: 0)
        
        
        //needed to create cells
        tableView.dataSource = self
        tableView.rowHeight = 200
        tableView.estimatedRowHeight = 50
        
        //fetchGames()
        
    }
    
    
    
    @objc func didPullToRefresh(_ refreshControl: UIRefreshControl){
        fetchGames()
    }

    func fetchGames(){
        GamesApiManager().nowPlayingGames { (games: [Games]?, error: Error?) in
            if let games = games {
                self.games = games
                self.tableView.reloadData()
                self.refreshControl.endRefreshing()
            }
        }
    }
    
    
    @IBAction func onProfile(_ sender: Any) {
        performSegue(withIdentifier: "profileSegue", sender: nil)
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GameCell", for: indexPath) //as! GameCell
        //cell.game = games [indexPath.row]
        
        return cell
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //let cell = sender as! UITableViewCell
        //if let indexpath = tableView.indexPath(for: cell){
       /* let game = games[IndexPath.row]
        let detailedViewController = segue.destination as! DetailedViewController
        DetailedViewController.games = game */
            performSegue(withIdentifier: "detailedSegue", sender: nil)
        
    }
    
}
