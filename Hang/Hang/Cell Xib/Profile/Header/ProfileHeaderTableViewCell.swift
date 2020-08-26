//
//  ProfileHeaderTableViewCell.swift
//  Hang
//
//  Created by Sohaib on 8/17/20.
//  Copyright © 2020 Hang. All rights reserved.
//

import UIKit

class ProfileHeaderTableViewCell: UITableViewHeaderFooterView {
    
    static let reuseID: String = "profileHeaderRID"

    @IBOutlet weak var titleLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setup() {
        
    }
}
