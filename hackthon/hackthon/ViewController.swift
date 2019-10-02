//
//  ViewController.swift
//  hackthon
//
//  Created by Jiratip Hemwutthipan on 2/10/2562 BE.
//  Copyright © 2562 SandBlue. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var camBtn : UIButton!
    @IBOutlet weak var friendBtn : UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func tapToCamera(_ sender: Any) {
        performSegue(withIdentifier: "toCam", sender: self)
    }
    
    @IBAction func tapToFriend(_ sender: Any) {
        performSegue(withIdentifier: "toF", sender: self)
    }
    
}
