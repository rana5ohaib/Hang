//
//  ProfileTableViewCell.swift
//  Hang
//
//  Created by Sohaib on 8/17/20.
//  Copyright © 2020 Hang. All rights reserved.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {
    
    static let reuseID: String = "profileCellRID"
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var genderLbl: UILabel!
    @IBOutlet weak var ageLbl: UILabel!
    @IBOutlet weak var usernameLbl: UILabel!
    @IBOutlet weak var statusDot: UIView!
    @IBOutlet weak var soloBtnImage: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
