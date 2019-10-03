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
    @IBOutlet fileprivate var capturePreviewView: UIView!
    @IBOutlet weak var addFriend: UIButton!
    let cameraController = CameraController()
    
    override var prefersStatusBarHidden: Bool { return true }
    

    
    
    
}

extension TakePhotoViewController {
    override func viewDidLoad() {
        
//        func configureCameraController() {
//          cameraController.prepare(for: "TakePhoto") {(error) in
//                if let error = error {
//                    print(error)
//                }
//
//                try? self.cameraController.displayPreview(on: self.capturePreviewView)
//            }
//        }
//        configureCameraController()
      
    }
}

extension TakePhotoViewController {
    
    @IBAction func addFriend(_ sender: UIButton) {
        // perform segue
    }
    
}
