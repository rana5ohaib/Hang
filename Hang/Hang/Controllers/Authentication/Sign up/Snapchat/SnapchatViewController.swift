//
//  SnapchatViewController.swift
//  Hang
//
//  Created by Devfactori II on 8/10/20.
//  Copyright © 2020 Hang. All rights reserved.
//

import UIKit
import SCSDKLoginKit

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
            attributedString.addAttribute(NSAttributedString.Key.underlineStyle , value: NSUnderlineStyle.thick.rawValue, range: NSRange(location: 12, length: 8))
            
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
    
    func fetchSnapUserInfo() {
        let graphQLQuery = "{me{displayName, bitmoji{avatar}}}"

        let variables = ["page": "bitmoji"]

        SCSDKLoginClient.fetchUserData(withQuery: graphQLQuery, variables: variables, success: { (resources: [AnyHashable: Any]?) in
            
            guard let resources = resources,
                let data = resources["data"] as? [String: Any],
                let me = data["me"] as? [String: Any] else { return }

            let displayName = me["displayName"] as? String
            var bitmojiAvatarUrl: String?
            if let bitmoji = me["bitmoji"] as? [String: Any] {
                bitmojiAvatarUrl = bitmoji["avatar"] as? String
                print(bitmojiAvatarUrl)
            }
            
        }, failure: { (error: Error?, isUserLoggedOut: Bool) in
                // handle error
        })
    }
}

//================================
// MARK: - IBActions
//================================
extension SnapchatViewController {
    @IBAction func backBtn(_sender: UIButton) {
        popController()
    }
    @IBAction func nextBtnActn(sender: UIButton) {
        if validte() {
            SCSDKLoginClient.login(from: self, completion: { (success : Bool, error : Error?) in

                if let error = error {
                    print(error.localizedDescription)
                    return
                }

                if success {
                    self.fetchSnapUserInfo()
                }
            })
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
        if segue.identifier == "toGenderSegueID",
            let vC = segue.destination as? GenderViewController {
            
            vC.authId = authId
            vC.countryCode = countryCode
            vC.phoneNumber = phoneNumber
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

//================================
// MARK: - Helping functions
//================================
extension SnapchatViewController {
    @IBAction func loginButtonTapped(_ sender: Any) {
        
        SCSDKLoginClient.login(from: self, completion: { (success : Bool, error : Error?) in

            if let error = error {
                print(error.localizedDescription)
                return
            }

            if success {
                self.fetchSnapUserInfo()
            }
        })
    }
}
