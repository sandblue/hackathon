//
//  addFriendsViewController.swift
//  hackthon
//
//  Created by GDG on 28/9/2562 BE.
//  Copyright © 2562 SandBlue. All rights reserved.
//

import UIKit
import ContactsUI
class addFriendsViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UITextFieldDelegate,dataDelegate {

    @IBOutlet weak var txfName: UITextField!
    @IBOutlet weak var txfTel: UITextField!
    @IBOutlet weak var imFace: UIImageView!
    var chosenImage = UIImage()
    let picker = UIImagePickerController()
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        picker.delegate = self
        let imgChangePhotoTap = UITapGestureRecognizer(target: self, action: #selector(self.imgChangePhotoTapped))
        self.imFace.isUserInteractionEnabled = true
        self.imFace.addGestureRecognizer(imgChangePhotoTap)
        
        self.imFace.layer.cornerRadius = self.imFace.frame.size.width / 2
        self.imFace.layer.masksToBounds = true
        
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
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[UIImagePickerController.InfoKey.editedImage]  as? UIImage else {
            return
        }
        self.chosenImage = addFriendsHelper.sharedInstance.imageOrientation(image)
        self.imFace.image = self.chosenImage
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
    }
    
    @IBAction func addPressed(_ sender: Any) {
        
    }
    @IBAction func btnContactPressed(_ sender: Any) {
        let conTact = UIStoryboard(name: "addFriend", bundle: nil).instantiateViewController(withIdentifier: "conTactListViewController") as! conTactListViewController
        conTact.delegate = self
        self.navigationController!.pushViewController(conTact, animated: true)
    }
    
}
