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
    
    
    friends = [Friend(id: 1, image: UIImage(named: "S__16678915_0") ?? UIImage(), name: "boat"),
               Friend(id: 2, image: UIImage(named: "messageImage_1569414367816") ?? UIImage(), name: "gg"),
               Friend(id: 3, image: UIImage(named: "messageImage_1569414348000") ?? UIImage(), name: "sleep")]
    self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "+", style: .done, target: self, action: #selector(addTapped))
  }
  @objc func addTapped(sender: UIBarButtonItem) {
    let storyboard = UIStoryboard(name: "addFriend", bundle: nil) //name -> ชื่อไฟล์, nilเพราะยุ pj เดียวกันยุแล้ว
    
    guard let addFriendsViewController = storyboard.instantiateViewController(withIdentifier: "addFriendsViewController") as? addFriendsViewController else {
      return
    }
    addFriendsViewController.isCheck = false
    addFriendsViewController.delegate = self
    
    self.navigationController?.pushViewController(addFriendsViewController, animated: true)
    
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
    return friends.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "FriendListTableViewCell", for: indexPath) as? FriendListTableViewCell else {
      return UITableViewCell()
    }
//    let beer = beers[indexPath.row]
//    cell.setupUI(beer: beer)
    
    let friendAtIndex = friends[indexPath.row]
    cell.setupUI(friendAtIndex: friendAtIndex)

    return cell
  }
  
  
}

extension friendListViewController: UITableViewDelegate {
  func  tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let storyboard = UIStoryboard(name: "addFriend", bundle: nil) //name -> ชื่อไฟล์, nilเพราะยุ pj เดียวกันยุแล้ว
    
    guard let addFriendsViewController = storyboard.instantiateViewController(withIdentifier: "addFriendsViewController") as? addFriendsViewController else {
      return
    }
     addFriendsViewController.isCheck = true
     addFriendsViewController.index = indexPath.row
     addFriendsViewController.delegate = self
    
     self.navigationController?.pushViewController(addFriendsViewController, animated: true)
    
    
  }
  
}

extension friendListViewController : setImage {
  func setImageAndString(image: UIImage, name: String, index: Int, isCheck: Bool) {
    if isCheck{
      let newdata = Friend(id: index + 1, image: image, name: name)
      friends[index] = newdata
      tableView.reloadData()
    }else {
      let newdata = Friend(id: friends.count + 1, image: image, name: name)
      UserDefaults.standard.set(image, forKey: "image3")
      friends.append(newdata)
      tableView.reloadData()
    }
  }
  
 
  
}
