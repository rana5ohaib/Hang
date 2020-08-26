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
    
    func setupCellForDiscover(_ section: Int) {
        
        // common for all 3
        statusDot.isHidden = true
        
        if section == 0 {
            nameLbl.text = "Gina Rossi + 3 Others"
            
            statusLbl.textColor = .RowGoldenColor
            statusLbl.text = "🌟 Featured"
            
            joinBtn.setTitle("Join", for: .normal)
            joinBtn.backgroundColor = .RowGoldenColor
            joinBtn.setTitleColor(.white, for: .normal)
            joinBtn.borderWidth = 0.0
            joinBtn.borderColor = .clear
            
            soloBtnImage.borderColor = .RowGoldenColor
            
            togetherBtnImage.isHidden = false
            togetherBtnImage.backgroundColor = .RowGoldenColor
            togetherBtnImage.borderWidth = 1.0
            togetherBtnImage.borderColor = .white
            togetherBtnImage.setTitle("+3", for: .normal)
            togetherBtnImage.setImage(nil, for: .normal)
            
        } else if section == 1 {
            nameLbl.text = "Gina Rossi"
            
            statusLbl.textColor = .HangBlue
            statusLbl.text = "Active"
            
            joinBtn.setTitle("Join", for: .normal)
            joinBtn.backgroundColor = .HangBlue
            joinBtn.setTitleColor(.white, for: .normal)
            joinBtn.borderWidth = 0.0
            joinBtn.borderColor = .clear
            
            soloBtnImage.borderColor = .HangBlue
            
            togetherBtnImage.isHidden = false
            togetherBtnImage.backgroundColor = .HangBlue
            togetherBtnImage.borderWidth = 1.0
            togetherBtnImage.borderColor = .white
            togetherBtnImage.setTitle("", for: .normal)
            togetherBtnImage.setTitleColor(.white, for: .normal)
            togetherBtnImage.setImage(UIImage(named: "Bitmoji Sample"), for: .normal)
            
        } else if section == 2 {
            nameLbl.text = "Gina Rossi"
            
            statusLbl.textColor = .HangGreen
            statusLbl.text = "Online"
            
            joinBtn.setTitle("Follow", for: .normal)
            joinBtn.backgroundColor = .white
            joinBtn.setTitleColor(.HangGreen, for: .normal)
            joinBtn.borderWidth = 1.0
            joinBtn.borderColor = .HangGreen
            
            soloBtnImage.borderColor = .HangGreen
            
            togetherBtnImage.isHidden = true
        }
    }
    
    func setupCellForFriends(_ section: Int) {
        
        // comon for all 3
        nameLbl.text = "Aldo A"
        togetherBtnImage.isHidden = true
        
        
        if section == 0 {
            statusDot.isHidden = true
            statusLbl.text = "@aldoa328"
            
            soloBtnImage.borderColor = .HangBlue
            soloBtnImage.tintColor = .clear
            soloBtnImage.setImage(#imageLiteral(resourceName: "Bitmoji Sample"), for: .normal)
            
            joinBtn.setTitle("Follow", for: .normal)
            joinBtn.backgroundColor = .white
            joinBtn.setTitleColor(.HangBlue, for: .normal)
            joinBtn.borderWidth = 1.0
            joinBtn.borderColor = .HangBlue
            
        } else if section == 1 {
            statusDot.isHidden = true
            statusLbl.text = "@aldoa328"
            
            soloBtnImage.borderColor = .HangBlue
            soloBtnImage.tintColor = .clear
            soloBtnImage.setImage(#imageLiteral(resourceName: "Bitmoji Sample"), for: .normal)
            
            joinBtn.setTitle("Follow", for: .normal)
            joinBtn.backgroundColor = .white
            joinBtn.setTitleColor(.HangBlue, for: .normal)
            joinBtn.borderWidth = 1.0
            joinBtn.borderColor = .HangBlue
            
        } else if section == 2 {
            statusDot.isHidden = false
            statusDot.backgroundColor = .HangGrey
            statusLbl.text = "Offline"
            
            soloBtnImage.borderColor = .HangGrey
            soloBtnImage.tintColor = .HangGrey
            soloBtnImage.setImage(UIImage(systemName: "person.crop.circle"), for: .normal)
            
            joinBtn.setTitle("Add", for: .normal)
            joinBtn.backgroundColor = .HangBlue
            joinBtn.setTitleColor(.white, for: .normal)
            joinBtn.borderWidth = 0.0
            joinBtn.borderColor = .clear
        }
    }
    
    func setupCellForProfile(_ section: Int) {
        statusDot.isHidden = true
        
        statusLbl.textColor = UIColor(r: 99.0, g: 108.0, b: 117.0, a: 1.0)
        statusLbl.text = "@someUser123"
        
        soloBtnImage.borderColor = .HangBlue
        
        joinBtn.backgroundColor = .white
        joinBtn.borderWidth = 1.0
        joinBtn.borderColor = .HangBlue
        joinBtn.setTitle("Follow", for: .normal)
        joinBtn.setTitleColor(.HangBlue, for: .normal)
    }
}
