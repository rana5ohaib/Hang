//
//  PhoneNumberViewController.swift
//  Hang
//
//  Created by Devfactori II on 8/9/20.
//  Copyright © 2020 Hang. All rights reserved.
//

import UIKit

class PhoneNumberViewController: UIViewController {
    
    /// Q- Whats yours phone number Label?
    @IBOutlet weak var yourNumberLbl: UILabel!
    
    @IBOutlet weak var termsLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }

    func setupView() {
        
        func setupLabels() {
            
            let attributedString = NSMutableAttributedString(string: "What's your Phone Number? 📱", attributes: [
              .font: UIFont(name: "BPreplay-Bold", size: 18.0)!,
              .foregroundColor: UIColor(white: 0.0, alpha: 1.0)
            ])
            attributedString.addAttribute(NSAttributedString.Key.underlineStyle , value: NSUnderlineStyle.thick.rawValue, range: NSRange(location: 12, length: 12))
            
            yourNumberLbl.attributedText = attributedString
            
            let attributedString1 = NSMutableAttributedString(string: "By signing up you agree to our Terms of Service and our Privacy Policy", attributes: [
              .font: UIFont(name: "BPreplay-Bold", size: 10.0)!,
              .foregroundColor: UIColor(named: "Hang Grey") ?? UIColor(white: 0.0, alpha: 1.0)
            ])
            attributedString1.addAttribute(NSAttributedString.Key.underlineStyle , value: NSUnderlineStyle.thick.rawValue, range: NSRange(location: 31, length: 16))
            
            attributedString1.addAttribute(NSAttributedString.Key.underlineStyle , value: NSUnderlineStyle.thick.rawValue, range: NSRange(location: 56, length: 14))
            
            termsLbl.attributedText = attributedString1
        }
        
        setupLabels()
    }
}
