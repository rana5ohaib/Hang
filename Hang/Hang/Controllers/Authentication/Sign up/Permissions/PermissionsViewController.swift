//
//  PermissionsViewController.swift
//  Hang
//
//  Created by Sohaib on 8/10/20.
//  Copyright © 2020 Hang. All rights reserved.
//

import UIKit

class PermissionsViewController: BaseViewController {
    
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var locationSwitch: UISwitch!
    @IBOutlet weak var notifSwitch: UISwitch!
    @IBOutlet weak var contactsSwitch: UISwitch!
    @IBOutlet weak var cameraSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func allAreOff() -> Bool {
        if locationSwitch.isOn ||
            notifSwitch.isOn ||
            contactsSwitch.isOn ||
            cameraSwitch.isOn {
            return false
        }
        return true
    }
    
    func changeNextBtnClr(_ isOn: Bool) {
        if isOn {
            colorNextBtn(btn: nextBtn)
        } else if allAreOff() {
            deColorNextBtn(btn: nextBtn)
        }
    }
    
    @IBAction func backBtn(_ sender: UIButton) {
        popController()
    }

    @IBAction func locationSwitch(_ sender: UISwitch) {
        changeNextBtnClr(sender.isOn)
    }
    
    @IBAction func notifsSwitch(_ sender: UISwitch) {
        changeNextBtnClr(sender.isOn)
    }
    
    @IBAction func contactsSwitch(_ sender: UISwitch) {
        changeNextBtnClr(sender.isOn)
    }
    
    @IBAction func cameraSwitch(_ sender: UISwitch) {
        changeNextBtnClr(sender.isOn)
    }
    
    @IBAction func nextBtnActn(_ sender: UIButton) {
        showAlert(withMessage: "Sign up is complete 😃")
    }
    
}
