//
//  SnapchatViewController.swift
//  Hang
//
//  Created by Devfactori II on 8/10/20.
//  Copyright © 2020 Hang. All rights reserved.
//

import UIKit

class SnapchatViewController: BaseViewController {
    
    //================================
    // MARK: - Outlets
    //================================
    @IBOutlet weak var yourSnapLbl: UILabel!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var snapTextField: UITextField!
    @IBOutlet weak var snapFieldBaseline: UIView!
    
    // Variables
    var authId: Int?
    var countryCode: String?
    var phoneNumber: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
}

//================================
// MARK: - Helping functions
//================================
extension SnapchatViewController {
    
    func setupView() {
        
        func setupLabels() {
            
            let attributedString = NSMutableAttributedString(string: "What’s your Snapchat Username? 👻", attributes: [
              .font: UIFont(name: "BPreplay-Bold", size: 18.0)!,
              .foregroundColor: UIColor(white: 0.0, alpha: 1.0)
            ])
            attributedString.addAttribute(NSAttributedString.Key.underlineStyle , value: NSUnderlineStyle.thick.rawValue, range: NSRange(location: 11, length: 8))
            
            yourSnapLbl.attributedText = attributedString
        }
        
        setupLabels()
    }
    
    func validte() -> Bool {
        if snapTextField.text?.isEmpty ?? true {
            return false
        }
        return true
    }
}

//================================
// MARK: - IBActions
//================================
extension SnapchatViewController {
    @IBAction func nextBtnActn(sender: UIButton) {
        if validte() {
            //getAuthID(phoneNumberTextField.text ?? "", countryCodeField .text ?? "")
        } else {
            showAlert(withMessage: "Enter your snap 👀")
        }
    }
}

//================================
// MARK: - Performing Segues
//================================
extension SnapchatViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toCodeValidationSegue",
            let vC = segue.destination as? CodeViewController {
            
            vC.authId = authId
//            vC.countryCode = countryCodeField.text
//            vC.phoneNumber = phoneNumberTextField.text
        }
    }
}

//================================
// MARK: - UITextField Delegate
//================================
extension SnapchatViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        snapFieldBaseline.backgroundColor = .HangBlue
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        snapFieldBaseline.backgroundColor = .HangGrey
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if !string.isEmpty {
            colorNextBtn(btn: nextBtn)
        } else {
            deColorNextBtn(btn: nextBtn)
        }
        return true
    }
}
