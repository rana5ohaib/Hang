//
//  SectionHeaderView.swift
//  Hang
//
//  Created by Sohaib on 8/16/20.
//  Copyright © 2020 Hang. All rights reserved.
//

import UIKit

class SectionHeaderView: UITableViewHeaderFooterView {
    
    static let reuseID: String = "mainSectionRId"

    @IBOutlet weak var title: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func setupHeader(_ section: Int) {
        if section == 0 {
            title.text = "Friends (20)"
            
        } else if section == 1 {
            title.text = "Add Contacts"
        }
    }
    
}
