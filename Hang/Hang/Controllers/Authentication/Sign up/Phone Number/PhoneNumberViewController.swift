//
//  PhoneNumberViewController.swift
//  Hang
//
//  Created by Devfactori II on 8/9/20.
//  Copyright © 2020 Hang. All rights reserved.
//

import UIKit

class PhoneNumberViewController: BaseViewController {
    
    //================================
    // MARK: - Outlets
    //================================
    /// Q- Whats yours phone number Label?
    @IBOutlet weak var countryCodeField: UITextField!
    @IBOutlet weak var yourNumberLbl: UILabel!
    @IBOutlet weak var termsLbl: UILabel!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var phoneInfoBaseline: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
}

//================================
// MARK: - Helping functions
//================================
extension PhoneNumberViewController {
    
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
    
    func validte() -> Bool {
        if countryCodeField.text?.isEmpty ?? true ||
            phoneNumberTextField.text?.isEmpty ?? true {
            return false
        }
        return true
    }
}

//================================
// MARK: - IBActions
//================================
extension PhoneNumberViewController {
    @IBAction func nextBtnActn(sender: UIButton) {
        if validte() {
            performSegue(withIdentifier: "toCodeValidationSegue", sender: nil)
        } else {
            showAlert(withMessage: "Enter a Valid Number 👀")
        }
    }
}

//================================
// MARK: - Performing Segues
//================================
extension PhoneNumberViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toCodeValidationSegue",
            let vC = segue.destination as? CodeViewController {
            
            vC.countryCode = countryCodeField.text
            vC.phoneNumber = phoneNumberTextField.text
        }
    }
}

//================================
// MARK: - UITextField Delegate
//================================
extension PhoneNumberViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        phoneInfoBaseline.backgroundColor = .HangBlue
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        phoneInfoBaseline.backgroundColor = .HangGrey
    }
}
