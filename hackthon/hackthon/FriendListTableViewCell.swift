//
//  FriendListTableViewCell.swift
//  hackthon
//
//  Created by Aksorn Khantasit on 30/9/2562 BE.
//  Copyright © 2562 SandBlue. All rights reserved.
//

import UIKit

class FriendListTableViewCell: UITableViewCell {
  
  @IBOutlet weak var imageFriend: UIImageView!
  @IBOutlet weak var name: UILabel!
  @IBOutlet weak var btnStatus: UIButton!
  
  @IBOutlet weak var checkState: UISwitch!
  
  //let defaults = UserDefaults.standard
  var switchON : Bool = false
  
  
 // var accepted = false
  
  @IBAction func switchStatus(_ sender: UISwitch) {
    if (sender.isOn == true)
    {
      switchON = true
      btnStatus.setTitle("accepted", for: .normal)
      //defaults.set(switchON, forKey: "switchON")
    }
    if (sender.isOn == false)
    {
      switchON = false
      //defaults.set(switchON, forKey: "switchON")
      btnStatus.setTitle("request", for: .normal)
    }
    
  }
  @IBAction func btnStatus(_ sender: Any) {
    //accepted = true
    btnStatus.setTitle("accepted", for: .normal)
    
    
  }
  
  
  
    override func awakeFromNib() {
        super.awakeFromNib()
      checkState.setOn(false, animated: false)
//      self.layoutIfNeeded()
//      layer.cornerRadius = self.frame.height / 2.0
//      layer.masksToBounds = true
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
