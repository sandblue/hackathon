//
//  mainpageViewController.swift
//  hackthon
//
//  Created by Aksorn Khantasit on 1/10/2562 BE.
//  Copyright © 2562 SandBlue. All rights reserved.
//

import Foundation
import UIKit

class mainpageViewController: UIViewController {
  
  
  @IBAction func btnFriendList(_ sender: Any) {
    let storyboard = UIStoryboard(name: "FriendList", bundle: nil)
    
    guard let friendListViewController = storyboard.instantiateViewController(withIdentifier: "friendListViewController") as? friendListViewController else {
      return
    }
   self.navigationController?.pushViewController(friendListViewController, animated: true)
//    self.navigationController?(friendListViewController, animated: true)
   
  }
  
  
   override func viewDidLoad() {
    super.viewDidLoad()
  
  }
  
  
  
}
