//
//  TakePhotoViewController.swift
//  hackthon
//
//  Created by Aksorn Khantasit on 3/10/2562 BE.
//  Copyright © 2562 SandBlue. All rights reserved.
//

import Foundation
import UIKit

class TakePhotoViewController: UIViewController {
  var deeplink: String = ""
  @IBAction func btnApi(_ sender: Any) {
    
    
  }
  override func viewDidLoad() {
    APIManager().postCustomer()
    
    APIManager().generateDeeplink() { result in
      let results: [String: AnyObject] = result as! [String : AnyObject]
      for index in results {
        if index.key == "deeplinkUrl" {
          self.deeplink = index.value as! String
          print("deeplink: \(index)")
        }
      }
    }
    
  }

}
