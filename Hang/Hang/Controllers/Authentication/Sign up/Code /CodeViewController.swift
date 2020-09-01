//
//  CodeViewController.swift
//  Hang
//
//  Created by Sohaib on 8/9/20.
//  Copyright © 2020 Hang. All rights reserved.
//

import UIKit
import Alamofire

class CodeViewController: BaseViewController {
    
    //===============================
    // MARK: - Outlets
    //===============================
    /// We sent yiou a text on <#number>
    @IBOutlet weak var phoneStringLbl: UILabel!
    @IBOutlet weak var codeTextField: UITextField!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var resendLbl: UILabel!
    @IBOutlet weak var codeFieldBaseline: UIView!
    
    // Variables
    var authId: Int?
    var countryCode: String?
    var phoneNumber: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
}

//===============================
// MARK: - Helping Functions
//===============================
extension CodeViewController {
    
    func setupView() {
        
        func setupLabels() {
            phoneStringLbl.text = "We sent you a text at \(phoneNumber ?? "")"
        }
        
        setupLabels()
    }
    
    func validate() -> Bool {
        if codeTextField.text?.isEmpty ?? true {
            return false
        }
        return true
    }
}

//===============================
// MARK: - IBActions
//===============================
extension CodeViewController {
    @IBAction func nextBtnActn(sender: UIButton) {
        if validate() {
//            let id = authId {
            //verifyOTP(id, codeTextField.text ?? "")
            performSegue(withIdentifier: "toSnapBitmojiSegue", sender: nil)
        } else {
            showAlert(withMessage: "Enter a Valid Code 🔑")
        }
    }
    @IBAction func backBtnActn(sender: UIButton) {
        popController()
    }
}

//================================
// MARK: - UITextField Delegate
//================================
extension CodeViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        codeFieldBaseline.backgroundColor = .HangBlue
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        codeFieldBaseline.backgroundColor = .HangGrey
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

//================================
// MARK: - Performing Segues
//================================
extension CodeViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSnapBitmojiSegue",
            let vC = segue.destination as? SnapchatViewController {
            
            vC.authId = authId
            vC.countryCode = countryCode
            vC.phoneNumber = phoneNumber
        }
    }
}

//================================
// MARK: - Networking Calls
//================================
extension CodeViewController {
    
    func verifyOTP(_ authID: Int, _ otp: String) {

        if ReachabilityManager.shared.isConnected {
            
            let method: HTTPMethod = .get
            let headers: HTTPHeaders? = [
                "X-Authy-API-Key": "km7fJOO32EDzW7b4VEtJjGFYUebtH8tc"
            ]
            
            let strURL = "https://api.authy.com/protected/json/verify/\(otp)/\(authID)"
            
            AF.request(strURL,
                       method: method,
                       parameters: nil,
                       encoding: URLEncoding.default,
                       headers: headers)
                .validate()
                .responseJSON(completionHandler: { (response) in
                    switch response.result {
                    case .success(_):
                        self.performSegue(withIdentifier: "toSnapBitmojiSegue", sender: nil)
                    case.failure:
                        self.showAlert(withMessage: "Enter a Valid Code 🔑")
                    }
                })
        } else {
            showAlert(withMessage: "You are not connected to internet 👀")
        }
    }
}
