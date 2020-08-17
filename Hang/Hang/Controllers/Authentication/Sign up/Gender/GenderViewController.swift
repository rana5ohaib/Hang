//
//  GenderViewController.swift
//  Hang
//
//  Created by Sohaib on 8/10/20.
//  Copyright © 2020 Hang. All rights reserved.
//

import UIKit
import Foundation

enum Gender: String {
    case male, female
}

class GenderViewController: BaseViewController {
    
    //===============================
    // MARK: - Outlets
    //===============================
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var usernameFieldBaseline: UIView!
    @IBOutlet weak var ageFieldBaseline: UIView!
    @IBOutlet weak var ageErrorLbl: UILabel!
    @IBOutlet weak var guyBtn: UIButton!
    @IBOutlet weak var girlBtn: UIButton!
    
    var datePicker : UIDatePicker!
    var selectedDate : Date? = nil
    
    // Variables
    var authId: Int?
    var countryCode: String?
    var phoneNumber: String?
    var selectedGender: Gender?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
}

//===============================
// MARK: - Helping Functions
//===============================
extension GenderViewController {
    
    func setupView() {
        
    }
    
    func not13Plus(startDate: Date) -> Bool {

        let calendar = Calendar.current

        let components = calendar.dateComponents([.year], from: startDate, to: Date())

        return components.year! <= 13
    }
    
    func validate() -> Bool {
        if usernameTextField.text?.isEmpty ?? true {
            showAlert(withMessage: "Enter your username 👀")
            return false
        }
        if selectedGender == nil {
            showAlert(withMessage: "Select your gender 👀")
            return false
        }
        if ageTextField.text?.isEmpty ?? true {
            showAlert(withMessage: "Enter your age 👀")
            return false
        } else if not13Plus(startDate: selectedDate ?? Date()) {
            makeTextFieldAndErrorLblRed(ageTextField, ageFieldBaseline, ageErrorLbl)
            return false
        }
        return true
    }
    
    func pickUpDate(_ textField : UITextField){
        
        datePicker = UIDatePicker(frame:CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 216))
        datePicker.backgroundColor = UIColor.white
        ageTextField.inputView = self.datePicker
        datePicker.datePickerMode = UIDatePicker.Mode.date
        
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor.darkGray
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(GenderViewController.doneClick))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(GenderViewController.cancelClick))
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        textField.inputAccessoryView = toolBar
    }
    
    @objc func doneClick(){
        
        selectedDate = datePicker.date
        ageTextField.resignFirstResponder()
        
        let dateFromString = DateManager.sharedInstance.dateToStringForDateDone(date: datePicker.date)
        
        ageTextField.text = DateManager.sharedInstance.dateToStringFromServer(date: dateFromString)
        
        if !(usernameTextField.text?.isEmpty ?? true) {
            colorNextBtn(btn: nextBtn)
        }
    }
    
    @objc func cancelClick(){
        ageTextField.resignFirstResponder()
    }
}

//===============================
// MARK: - IBActions
//===============================
extension GenderViewController {
    @IBAction func guyBtn(_ sender: UIButton) {
        selectedGender = .male
        sender.backgroundColor = .HangBlue
        sender.setTitleColor(.white, for: .normal)
        girlBtn.backgroundColor = .BtnBackground
        girlBtn.setTitleColor(.HangGreyText, for: .normal)
    }
    @IBAction func girlBtn(_ sender: UIButton) {
        selectedGender = .female
        sender.backgroundColor = .HangBlue
        sender.setTitleColor(.white, for: .normal)
        guyBtn.backgroundColor = .BtnBackground
        guyBtn.setTitleColor(.HangGreyText, for: .normal)
    }
    @IBAction func nextBtnActn(sender: UIButton) {
        if validate() {
            performSegue(withIdentifier: "toImagesSegueId", sender: nil)
        }
    }
    @IBAction func backBtnActn(sender: UIButton) {
        popController()
    }
}

//================================
// MARK: - UITextField Delegate
//================================
extension GenderViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == usernameTextField {
            usernameFieldBaseline.backgroundColor = .HangBlue
        } else if textField == ageTextField {
            unMakeTextFieldAndErrorLblRed(ageTextField, ageFieldBaseline, ageErrorLbl)
            ageFieldBaseline.backgroundColor = .HangBlue
            self.pickUpDate(ageTextField)
            guard let selectedDate = self.selectedDate else { return }
            self.datePicker.date = selectedDate
        }
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == usernameTextField {
            usernameFieldBaseline.backgroundColor = .HangGrey
        } else if textField == ageTextField {
            ageFieldBaseline.backgroundColor = .HangGrey
        }
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if !string.isEmpty,
            (textField == usernameTextField && !(ageTextField.text?.isEmpty ?? true)) {
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
extension GenderViewController {
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
extension GenderViewController {
    
}
