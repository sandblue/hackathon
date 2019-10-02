//
//  friendListViewController.swift
//  hackthon
//
//  Created by Jiratip Hemwutthipan on 2/10/2562 BE.
//  Copyright © 2562 SandBlue. All rights reserved.
//

import UIKit

class friendListViewController: UIViewController {
    
    @IBOutlet weak var addFriend: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func tapToAddFriend(_ sender: Any) {
        performSegue(withIdentifier: "addF", sender: self)
    }
    
}
