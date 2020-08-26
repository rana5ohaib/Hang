//
//  FollowersFollowingHeader.swift
//  Hang
//
//  Created by Devfactori II on 8/17/20.
//  Copyright © 2020 Hang. All rights reserved.
//

import UIKit

class FollowersFollowingHeader: UITableViewHeaderFooterView {
    
    static let reuseID: String = "followersFollowingRID"
    
    @IBOutlet weak var followersLineView: UIView!
    @IBOutlet weak var followingLineView: UIView!
    
    var followersBtnClosure: (() -> Void)?
    var followingBtnClosure: (() -> Void)?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func followersBtnActn(_ sender: Any) {
        selectFollowersBtn()
        followersBtnClosure?()
    }
    
    @IBAction func followingBtnActn(_ sender: Any) {
        selectFollowingBtn()
        followingBtnClosure?()
    }
    
    func selectFollowersBtn() {
        followersLineView.backgroundColor = .HangPurple
        followingLineView.backgroundColor = .clear
    }
    
    func selectFollowingBtn() {
        followingLineView.backgroundColor = .HangPurple
        followersLineView.backgroundColor = .clear
    }
    
    func setupHeader() {
    }
}
