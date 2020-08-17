//
//  PhoneNumberViewController.swift
//  Hang
//
//  Created by Sohaib on 8/9/20.
//  Copyright © 2020 Hang. All rights reserved.
//

import UIKit
import Alamofire

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
    
    // Variables
    var authId: Int?
    
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
            //getAuthID(phoneNumberTextField.text ?? "", countryCodeField .text ?? "")
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
            
            vC.authId = authId
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
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if !string.isEmpty,
            ((textField == phoneNumberTextField && !(countryCodeField.text?.isEmpty ?? true)) ||
            (textField == countryCodeField && !(phoneNumberTextField.text?.isEmpty ?? true))) {
            colorNextBtn(btn: nextBtn)
        } else {
            deColorNextBtn(btn: nextBtn)
        }
        return true
    }
}

//================================
// MARK: - Networking Calls
//================================
extension PhoneNumberViewController {
    
    func getAuthID(_ number: String, _ countryCode: String) {

        if ReachabilityManager.shared.isConnected {
            
            let method: HTTPMethod = .post
            let headers: HTTPHeaders? = [
                "X-Authy-API-Key": "km7fJOO32EDzW7b4VEtJjGFYUebtH8tc"
            ]
            let parameters = [
                "user[email]": "ranasohaib002@gmail.com",
                "user[cellphone]": number,
                "user[country_code]": countryCode,
            ]
            
            let strURL = "https://api.authy.com/protected/json/users/new"
            
            AF.request(strURL,
                       method: method,
                       parameters: parameters,
                       encoding: URLEncoding.default,
                       headers: headers)
                .validate()
                .responseJSON(completionHandler: { (response) in
                    switch response.result {
                    case .success(let value):
                        if let responseVal = value as? [String: Any],
                            let user = responseVal["user"] as? [String: Any],
                            let id = user["id"] as? Int {
                            self.authId = id
                            self.sendOTP(id)
                        }
                    case.failure:
                        self.showAlert(withMessage: "Enter a valid number 👀")
                    }
                })
        } else {
            showAlert(withMessage: "You are not connected to internet 👀")
        }
    }
    
    func sendOTP(_ authID: Int) {

        if ReachabilityManager.shared.isConnected {
            
            let method: HTTPMethod = .get
            let headers: HTTPHeaders? = [
                "X-Authy-API-Key": "km7fJOO32EDzW7b4VEtJjGFYUebtH8tc"
            ]
            
            let strURL = "https://api.authy.com/protected/json/sms/\(authID)"
            
            AF.request(strURL,
                       method: method,
                       parameters: nil,
                       encoding: URLEncoding.default,
                       headers: headers)
                .validate()
                .responseJSON(completionHandler: { (response) in
                    switch response.result {
                    case .success(_):
                        self.performSegue(withIdentifier: "toCodeValidationSegue", sender: nil)
                    case.failure:
                        self.showAlert(withMessage: "Enter a valid number 👀")
                    }
                })
        } else {
            showAlert(withMessage: "You are not connected to internet 👀")
        }
    }
}
