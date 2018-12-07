//
//  ProfileViewController.swift
//  GG
//
//  Created by Felipe De La Torre on 11/9/18.
//  Copyright © 2018 Felipe De La Torre. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    
    //beginnging of actions
    //action for back button
    @IBAction func onBack(_ sender: Any) {
        performSegue(withIdentifier: "returnSegue", sender: nil)
        
    }
    
    @IBAction func onLogout(_ sender: Any) {
     performSegue(withIdentifier: "logoutSegue", sender: nil)
    }
    
    
}
