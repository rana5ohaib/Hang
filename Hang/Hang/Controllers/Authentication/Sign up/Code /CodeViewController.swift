//
//  CodeViewController.swift
//  Hang
//
//  Created by Devfactori II on 8/9/20.
//  Copyright © 2020 Hang. All rights reserved.
//

import UIKit

class CodeViewController: BaseViewController {
    
    //===============================
    // MARK: - Outlets
    //===============================
    /// We sent yiou a text on <#number>
    @IBOutlet weak var phoneStringLbl: UILabel!
    @IBOutlet weak var codeTextField: UITextField!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var resendLbl: UILabel!
    
    // Variables
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
}

//===============================
// MARK: - IBActions
//===============================
extension CodeViewController {
    @IBAction func nextBtnActn(sender: UIButton) {
        
    }
    @IBAction func backBtnActn(sender: UIButton) {
        popController()
    }
}
