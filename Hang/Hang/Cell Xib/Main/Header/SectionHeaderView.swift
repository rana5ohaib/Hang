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
    
    func setupHeaderForHome(_ section: Int) {
        if section == 0 {
            title.text = "Friends (20)"
            
        } else if section == 1 {
            title.text = "Add Contacts"
        }
    }
    
    func setupHeaderForDiscover(_ section: Int) {
        if section == 0 {
            title.text = "Featured People"
            
        } else if section == 1 {
            title.text = "Meet New People"
            
        } else if section == 2 {
            title.text = "Find New People"
        }
    }
    
    func setupHeaderForFriends(_ section: Int) {
        if section == 0 {
            title.text = "Results"
            
        } else if section == 1 {
            title.text = "Recents"
            
        } else if section == 2 {
            title.text = "Add Contacts"
        }
    }
    
}
