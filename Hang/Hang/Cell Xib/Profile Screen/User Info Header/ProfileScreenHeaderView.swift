//
//  ProfileScreenHeaderView.swift
//  Hang
//
//  Created by Sohaib on 8/17/20.
//  Copyright © 2020 Hang. All rights reserved.
//

import UIKit

class ProfileScreenHeaderView: UITableViewHeaderFooterView {
    
    static let reuseID: String = "profileScreenHeaderRID"
    
    @IBOutlet weak var backBtn: UIButton!
    
    var backBtnClosure: (() -> Void)?
    var menuBtnClosure: (() -> Void)?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func backBtnActn(_ sender: UIButton) {
        backBtnClosure?()
    }
    
    @IBAction func menuBtnActn(_ sender: UIButton) {
        menuBtnClosure?()
    }
    
    func setupHeader(_ showBackBtn: Bool) {
        backBtn.isHidden = !showBackBtn
    }
}
