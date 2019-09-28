//
//  conTactTableViewCell.swift
//  hackthon
//
//  Created by GDG on 28/9/2562 BE.
//  Copyright © 2562 SandBlue. All rights reserved.
//

import UIKit

class conTactTableViewCell: UITableViewCell {

    @IBOutlet weak var laName: UILabel!
    @IBOutlet weak var lbPhone: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
