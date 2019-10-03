//
//  TakePhotoViewController.swift
//  hackthon
//
//  Created by Aksorn Khantasit on 3/10/2562 BE.
//  Copyright © 2562 SandBlue. All rights reserved.
//

import Foundation
import UIKit
import Photos

class TakePhotoViewController: UIViewController {
  var deeplink: String = ""
  @IBAction func btnApi(_ sender: Any) {
    ApiManager().request()
    
  }
  override func viewDidLoad() {
    //ApiManager().request() 
  }
    
    

}
