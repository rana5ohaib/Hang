//
//  UserInfoTableViewCell.swift
//  Hang
//
//  Created by Sohaib on 8/17/20.
//  Copyright © 2020 Hang. All rights reserved.
//

import UIKit

class UserInfoTableViewCell: UITableViewCell {
    
    static let reuseID: String = "profileUserInfoCellRID"
    
    var followBtnClosure: (() -> Void)?
    
    @IBOutlet weak var bitmojiBtnImg: UIView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var usernameLbl: UILabel!
    @IBOutlet weak var followBtn: UIButton!
    @IBOutlet weak var scoreLbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func followBtnActn(_ sender: UIButton) {
        if followBtn.titleLabel?.text?.hasPrefix("Edit") ?? false {
            followBtnClosure?()
        }
    }
    
    func setup( _ someOneElsesProfile: Bool) {
        if !someOneElsesProfile {
            followBtn.setTitle("Edit Profile", for: .normal)
            followBtn.backgroundColor = .white
            followBtn.borderWidth = 1.0
            followBtn.borderColor = .HangPurple
            followBtn.setTitleColor(.HangPurple, for: .normal)
        }
    }
}
