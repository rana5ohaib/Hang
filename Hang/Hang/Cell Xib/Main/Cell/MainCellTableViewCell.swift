//
//  MainCellTableViewCell.swift
//  Hang
//
//  Created by Sohaib on 8/16/20.
//  Copyright © 2020 Hang. All rights reserved.
//

import UIKit

class MainCellTableViewCell: UITableViewCell {
    
    static let reuseID: String = "mainTableCellRID"
    
    // CLOSURES
    var joinBtnClosure: (() -> Void)?
    
    // OUTLETS
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var statusLbl: UILabel!
    @IBOutlet weak var statusDot: UIView!
    @IBOutlet weak var soloBtnImage: UIButton!
    @IBOutlet weak var togetherBtnImage: UIButton!
    @IBOutlet weak var joinBtn: UIButton!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func joinBtnActn(_ sender: UIButton) {
        joinBtnClosure?()
    }
    
    func setupCellForHome(_ section: Int) {
        if section == 0 {
            
            soloBtnImage.borderColor = .HangGreen
            soloBtnImage.tintColor = .clear
            soloBtnImage.setImage(#imageLiteral(resourceName: "Bitmoji Sample"), for: .normal)
            
            togetherBtnImage.isHidden = true
            
            joinBtn.backgroundColor = .HangGreen
            
            joinBtn.setTitle("Join", for: .normal)
            
            statusDot.backgroundColor = .HangGreen
            
        } else if section == 1 {
            
            /// Setup default image
            soloBtnImage.borderColor = .HangGrey
            soloBtnImage.tintColor = .HangGrey
            soloBtnImage.setImage(UIImage(systemName: "person.crop.circle"), for: .normal)
            
            /// Hide the second image
            togetherBtnImage.isHidden = true
            
            joinBtn.backgroundColor = .HangBlue
            
            // If added (change state to <Added>)
            joinBtn.setTitle("Add", for: .normal)
            
            // If online or offline -> manage
            statusDot.backgroundColor = .HangGrey
        }
    }
}
