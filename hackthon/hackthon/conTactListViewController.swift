//
//  conTactListViewController.swift
//  hackthon
//
//  Created by GDG on 28/9/2562 BE.
//  Copyright © 2562 SandBlue. All rights reserved.
//

import UIKit
import ContactsUI

protocol dataDelegate: class {
    func userDidEnterInformation(info: String)
}

class conTactListViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    var dataContact = [contactObj]()
    weak var delegate: dataDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()

        self.fecthData()
    }
    
    func fecthData(){
        contactObj.sharedInstance.getContact { (ok, data) in
            self.dataContact = data
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataContact.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "conTactTableViewCell", for: indexPath) as! conTactTableViewCell
        let dataObj = self.dataContact[indexPath.row]
        cell.laName.text = dataObj.contactName
        cell.lbPhone.text = dataObj.contactNumber
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
            let dataObj = self.dataContact[indexPath.row]
            delegate?.userDidEnterInformation(info: dataObj.contactNumber!)
            _ = self.navigationController?.popViewController(animated: true)
            
        }
    
    
    @IBAction func btnBackPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    

}
