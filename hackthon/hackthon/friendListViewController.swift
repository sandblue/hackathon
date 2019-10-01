//
//  friendListViewController.swift
//  hackthon
//
//  Created by Aksorn Khantasit on 30/9/2562 BE.
//  Copyright © 2562 SandBlue. All rights reserved.
//

import Foundation
import UIKit

class friendListViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  var friends: [Friend] = []
  
  override func viewDidLoad() {
    
    
    let bundle = Bundle(for: FriendListTableViewCell.self)
    let nib = UINib(nibName: "FriendListTableViewCell", bundle: bundle)
    tableView.register(nib, forCellReuseIdentifier: "FriendListTableViewCell")
    
  }
  

}

extension friendListViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 5
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "FriendListTableViewCell", for: indexPath) as? FriendListTableViewCell else {
      return UITableViewCell()
    }
//    let beer = beers[indexPath.row]
//    cell.setupUI(beer: beer)
    return cell
  }
  
  
}

extension friendListViewController: UITableViewDelegate {
  
}
