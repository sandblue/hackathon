//
//  addFriendsViewController.swift
//  hackthon
//
//  Created by GDG on 28/9/2562 BE.
//  Copyright © 2562 SandBlue. All rights reserved.
//

import UIKit
import ContactsUI

protocol setImage : class{
  func setImageAndString(image:UIImage,name:String,index:Int,isCheck:Bool)
}
class addFriendsViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UITextFieldDelegate,dataDelegate {

    @IBOutlet weak var txfName: UITextField!
    @IBOutlet weak var txfTel: UITextField!
    @IBOutlet weak var imFace: UIImageView!
    weak var delegate : setImage?
    var index : Int = 0
    var chosenImage = UIImage()
    let picker = UIImagePickerController()
    var isCheck : Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        picker.delegate = self
        let imgChangePhotoTap = UITapGestureRecognizer(target: self, action: #selector(self.imgChangePhotoTapped))
        self.imFace.isUserInteractionEnabled = true
        self.imFace.addGestureRecognizer(imgChangePhotoTap)
        
    }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
   
  }
    
    func showChooseImagePopup()
    {
        let actionsheet = UIAlertController(title: nil, message: nil, preferredStyle: UIAlertController.Style.actionSheet)
        actionsheet.addAction(UIAlertAction(title: "ถ่ายรูป", style: UIAlertAction.Style.default, handler: { (action) -> Void in
            // show camera
            self.cameraTapped();
        }))
        actionsheet.addAction(UIAlertAction(title: "อัลบั้ม", style: UIAlertAction.Style.default, handler: { (action) -> Void in
            // image gallery
            self.showImagePicker()
        }))
        actionsheet.addAction(UIAlertAction(title: "ยกเลิก", style: UIAlertAction.Style.cancel, handler: { (action) -> Void in
            // Cancel
        }))
        self.present(actionsheet, animated: true, completion: nil)
    }
    
    // Show Picker
    func showImagePicker()
    {
        self.picker.allowsEditing = true
        self.picker.sourceType = .photoLibrary
        self.picker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
        self.picker.modalPresentationStyle = .fullScreen
      
        self.present(picker, animated: true, completion: nil)
    }
    
    func cameraTapped()
    {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            self.picker.allowsEditing = true
            self.picker.sourceType = UIImagePickerController.SourceType.camera
            self.picker.cameraCaptureMode = .photo
            self.picker.modalPresentationStyle = .fullScreen
            present(self.picker, animated: true, completion: nil)
        } else {
            noCamera()
        }
    }
    
    func noCamera(){
        let alertVC = UIAlertController(
            title: "No Camera",
            message: "Sorry, this device has no camera",
            preferredStyle: .alert)
        let okAction = UIAlertAction(
            title: "OK",
            style:.default,
            handler: nil)
        alertVC.addAction(okAction)
        present(
            alertVC,
            animated: true,
            completion: nil)
    }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "addFriendsViewControllerGoToconTactListViewController" {
      
      let viewcontroller = segue.destination as? conTactListViewController
      viewcontroller?.delegate = self
      viewcontroller?.name = "boat"
      
    }
    
  }
  
 
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[UIImagePickerController.InfoKey.editedImage]  as? UIImage else {
            return
        }
      
        self.chosenImage = addFriendsHelper.sharedInstance.imageOrientation(image)
        self.imFace.image = self.chosenImage
      
        //UserDefaults.standard.set(self.chosenImage, forKey: "img/")
        dismiss(animated: true) {
          
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func imgChangePhotoTapped(sender:UITapGestureRecognizer) {
        self.showChooseImagePopup()
    }
    
    func userDidEnterInformation(info: String) {
        self.txfTel.text = info
    }
    
    func userDidEnterInformationName(info: String) {
        self.txfName.text = info
      UserDefaults.standard.set(info, forKey: "name")
    }
    
    @IBAction func addPressed(_ sender: Any) {
//      let storyboard = UIStoryboard(name: "FriendList", bundle: nil)
//      guard let friendListViewController = storyboard.instantiateViewController(withIdentifier: "friendListViewController") as? friendListViewController else {
//        return
//      }
      delegate?.setImageAndString(image: chosenImage, name: txfName.text ?? "", index: index, isCheck: isCheck)
      self.navigationController?.popViewController(animated: true)
      
    }
  
    @IBAction func btnContactPressed(_ sender: Any) {
//        let conTact = UIStoryboard(name: "addFriend", bundle: nil).instantiateViewController(withIdentifier: "conTactListViewController") as! conTactListViewController
//      conTact.delegate = self
//      self.navigationController?.pushViewController(conTact, animated: true)
      performSegue(withIdentifier: "addFriendsViewControllerGoToconTactListViewController", sender: nil)
    }
    
}
