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
  
  @IBAction func btnBack(_ sender: Any) {
    let storyboard = UIStoryboard(name: "mainpage", bundle: nil)
    
    guard let mainpageViewController = storyboard.instantiateViewController(withIdentifier: "mainpageViewController") as? mainpageViewController else {
      return
    }
    self.present(mainpageViewController, animated: true) {
    }
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
  func  tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let storyboard = UIStoryboard(name: "addFriend", bundle: nil) //name -> ชื่อไฟล์, nilเพราะยุ pj เดียวกันยุแล้ว
    
    guard let addFriendsViewController = storyboard.instantiateViewController(withIdentifier: "addFriendsViewController") as? addFriendsViewController else {
      return
    }//id
    
    
//    let item = todoList[indexPath.item].title
//    detailViewController.str = item
    //        detailViewController.setTitle(title: item)$1
    //        self.present(detailViewController, animated: true, completion: nil)//หน้าviewConนี้จะpresentไร$2
    self.present(addFriendsViewController, animated: true) {
      
    }
    
  }
  
}
